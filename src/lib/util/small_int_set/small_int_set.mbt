// Copyright (C) 2025 International Digital Economy Academy
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; version 2.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, see <https://www.gnu.org/licenses/>.

///|
type SmallIntSet Array[Int] derive(Eq, Compare)

///|
pub typealias T = SmallIntSet

///|
let _empty = [0]

///|
pub fn empty() -> SmallIntSet {
  _empty
}

///|
pub fn singleton(key : Int) -> SmallIntSet {
  let word_index = key >> 5
  let result = Array::make(2, 0)
  result[0] = 1 << word_index
  result[1] = 1 << (key & 31)
  result
}

///|
pub fn is_empty(self : SmallIntSet) -> Bool {
  self._.length() == 1
}

///|
pub fn is_singleton(self : SmallIntSet, key : Int) -> Bool {
  self._.length() == 2 &&
  self._[0] == (1 << (key >> 5)) &&
  self._[1] == (1 << (key & 31))
}

///|
pub impl Hash for SmallIntSet with hash_combine(self, hasher) {
  for x in self._ {
    hasher.combine_int(x)
  }
}

///|
pub impl Show for SmallIntSet with output(self, logger) {
  logger.write_string("{")
  let mut first = true
  for key in self {
    if first {
      first = false
    } else {
      logger.write_string(", ")
    }
    logger.write_object(key)
  }
  logger.write_string("}")
}

///|
pub fn iter(self : SmallIntSet) -> Iter[Int] {
  Iter::new(fn(yield_) {
    let mut i = 0
    let mut bitmask = self._[0]
    while true {
      if bitmask == 0 {
        break
      }
      let word_index = bitmask.ctz()
      let mut word = self._[1 + i]
      while true {
        if word == 0 {
          break
        }
        let bit = word.ctz()
        match yield_(word_index * 32 + bit) {
          IterEnd => return IterEnd
          IterContinue => ()
        }
        word = word & (1 << bit).lnot()
      }
      bitmask = bitmask & (1 << word_index).lnot()
      i += 1
    }
    IterContinue
  })
}

///|
pub fn from_iter(iter : Iter[Int]) -> SmallIntSet {
  let mut bitmask = 0
  for key in iter {
    let word_index = key >> 5
    bitmask = bitmask | (1 << word_index)
  }
  let result = Array::make(1 + bitmask.popcnt(), 0)
  result[0] = bitmask
  for key in iter {
    let word_index = key >> 5
    let data_index = 1 + (bitmask & ((1 << word_index) - 1)).popcnt()
    result[data_index] = result[data_index] | (1 << (key & 31))
  }
  result
}

///|
pub fn contains(self : SmallIntSet, key : Int) -> Bool {
  let word_index = key >> 5
  let bitmask = self._[0]
  if (bitmask & (1 << word_index)) == 0 {
    return false
  }
  let data_index = 1 + (bitmask & ((1 << word_index) - 1)).popcnt()
  (self._[data_index] & (1 << (key & 31))) != 0
}

///|
pub fn add(self : SmallIntSet, key : Int) -> SmallIntSet {
  let word_index = key >> 5
  let bitmask0 = self._[0]
  let bitmask = bitmask0 | (1 << word_index)
  let data_index = 1 + (bitmask & ((1 << word_index) - 1)).popcnt()
  if bitmask == bitmask0 {
    if (self._[data_index] & (1 << (key & 31))) != 0 {
      return self
    }
    let result = self._.copy()
    result[data_index] = result[data_index] | (1 << (key & 31))
    result
  } else {
    let result = Array::make(1 + bitmask.popcnt(), 0)
    result[0] = bitmask
    self._.blit_to(result, len=data_index - 1, src_offset=1, dst_offset=1)
    self._.blit_to(
      result,
      len=self._.length() - data_index,
      src_offset=data_index,
      dst_offset=data_index + 1,
    )
    result[data_index] = 1 << (key & 31)
    result
  }
}

///|
pub fn remove(self : SmallIntSet, key : Int) -> SmallIntSet {
  let word_index = key >> 5
  let bitmask = self._[0]
  if (bitmask & (1 << word_index)) == 0 {
    return self
  }
  let result = self._.copy()
  let data_index = 1 + (bitmask & ((1 << word_index) - 1)).popcnt()
  result[data_index] = self._[data_index] & (1 << (key & 31)).lnot()
  if result[data_index] == 0 {
    result[0] = bitmask & (1 << word_index).lnot()
    result.remove(data_index) |> ignore
  }
  result
}

///|
pub fn union(self : SmallIntSet, other : SmallIntSet) -> SmallIntSet {
  let bitmask1 = self._[0]
  if bitmask1 == 0 {
    return other
  }
  let bitmask2 = other._[0]
  if bitmask2 == 0 {
    return self
  }
  let bitmask = bitmask1 | bitmask2
  if bitmask == bitmask1 {
    if physical_equal(self, other) {
      return self
    }
    let result = self._.copy()
    let mut bitmask2 = bitmask2
    let mut j = 1
    while true {
      let jb = bitmask2.ctz()
      if jb == 32 {
        break
      }
      let i = 1 + (bitmask1 & ((1 << jb) - 1)).popcnt()
      result[i] = result[i] | other._[j]
      j += 1
      bitmask2 = bitmask2 & (bitmask2 - 1)
    }
    result
  } else if bitmask == bitmask2 {
    if physical_equal(self, other) {
      return self
    }
    let result = other._.copy()
    let mut bitmask1 = bitmask1
    let mut i = 1
    while true {
      let ib = bitmask1.ctz()
      if ib == 32 {
        break
      }
      let j = 1 + (bitmask2 & ((1 << ib) - 1)).popcnt()
      result[j] = result[j] | self._[i]
      i += 1
      bitmask1 = bitmask1 & (bitmask1 - 1)
    }
    result
  } else {
    let result = Array::make(1 + bitmask.popcnt(), 0)
    result[0] = bitmask
    let mut i = 1
    let mut j = 1
    let mut k = 1
    let mut bitmask1 = bitmask1
    let mut bitmask2 = bitmask2
    while true {
      let ib = bitmask1.ctz()
      let jb = bitmask2.ctz()
      if ib < jb {
        result[k] = self._[i]
        i += 1
        bitmask1 = bitmask1 & (bitmask1 - 1)
      } else if ib > jb {
        result[k] = other._[j]
        j += 1
        bitmask2 = bitmask2 & (bitmask2 - 1)
      } else {
        if ib == 32 {
          break
        }
        result[k] = self._[i] | other._[j]
        i += 1
        j += 1
        bitmask1 = bitmask1 & (bitmask1 - 1)
        bitmask2 = bitmask2 & (bitmask2 - 1)
      }
      k += 1
    }
    result
  }
}

///|
pub fn intersection(self : SmallIntSet, other : SmallIntSet) -> SmallIntSet {
  let bitmask1 = self._[0]
  let bitmask2 = other._[0]
  let mut bitmask = bitmask1 & bitmask2
  let result = Array::make(1 + bitmask.popcnt(), 0)
  let to_remove_data_indices = []
  let mut i = 1
  let mut j = 1
  let mut k = 1
  let mut bitmask1 = bitmask1
  let mut bitmask2 = bitmask2
  while true {
    let ib = bitmask1.ctz()
    let jb = bitmask2.ctz()
    if ib < jb {
      i += 1
      bitmask1 = bitmask1 & (bitmask1 - 1)
    } else if ib > jb {
      j += 1
      bitmask2 = bitmask2 & (bitmask2 - 1)
    } else {
      if ib == 32 {
        break
      }
      result[k] = self._[i] & other._[j]
      if result[k] == 0 {
        to_remove_data_indices.push(k)
      }
      i += 1
      j += 1
      k += 1
      bitmask1 = bitmask1 & (bitmask1 - 1)
      bitmask2 = bitmask2 & (bitmask2 - 1)
    }
  }
  for i = to_remove_data_indices.length() - 1; i >= 0; i = i - 1 {
    let k = to_remove_data_indices[i]
    bitmask = clear_nth_set_bit(bitmask, k)
    result.remove(k) |> ignore
  }
  result[0] = bitmask
  result
}

///|
pub fn difference(self : SmallIntSet, other : SmallIntSet) -> SmallIntSet {
  let bitmask1 = self._[0]
  let bitmask2 = other._[0]
  let mut bitmask = bitmask1
  let result = Array::make(1 + bitmask.popcnt(), 0)
  let to_remove_data_indices = []
  let mut i = 1
  let mut j = 1
  let mut k = 1
  let mut bitmask1 = bitmask1
  let mut bitmask2 = bitmask2
  while true {
    let ib = bitmask1.ctz()
    let jb = bitmask2.ctz()
    if ib < jb {
      result[k] = self._[i]
      i += 1
      k += 1
      bitmask1 = bitmask1 & (bitmask1 - 1)
    } else if ib > jb {
      j += 1
      bitmask2 = bitmask2 & (bitmask2 - 1)
    } else {
      if ib == 32 {
        break
      }
      result[k] = self._[i] & other._[j].lnot()
      if result[k] == 0 {
        to_remove_data_indices.push(k)
      }
      i += 1
      j += 1
      k += 1
      bitmask1 = bitmask1 & (bitmask1 - 1)
      bitmask2 = bitmask2 & (bitmask2 - 1)
    }
  }
  for i = to_remove_data_indices.length() - 1; i >= 0; i = i - 1 {
    let k = to_remove_data_indices[i]
    bitmask = clear_nth_set_bit(bitmask, k)
    result.remove(k) |> ignore
  }
  result[0] = bitmask
  result
}

///|
pub fn disjoint(self : SmallIntSet, other : SmallIntSet) -> Bool {
  let bitmask1 = self._[0]
  let bitmask2 = other._[0]
  if (bitmask1 & bitmask2) != 0 {
    return false
  }
  let mut i = 1
  let mut j = 1
  let mut bitmask1 = bitmask1
  let mut bitmask2 = bitmask2
  while true {
    let ib = bitmask1.ctz()
    let jb = bitmask2.ctz()
    if ib < jb {
      i += 1
      bitmask1 = bitmask1 & (bitmask1 - 1)
    } else if ib > jb {
      j += 1
      bitmask2 = bitmask2 & (bitmask2 - 1)
    } else {
      if ib == 32 {
        break
      }
      if (self._[i] & other._[j]) != 0 {
        return false
      }
      i += 1
      j += 1
      bitmask1 = bitmask1 & (bitmask1 - 1)
      bitmask2 = bitmask2 & (bitmask2 - 1)
    }
  }
  return true
}

///|
pub fn subset(self : SmallIntSet, other : SmallIntSet) -> Bool {
  let bitmask1 = self._[0]
  let bitmask2 = other._[0]
  if (bitmask1 & bitmask2) != bitmask1 {
    return false
  }
  let mut i = 1
  let mut j = 1
  let mut bitmask1 = bitmask1
  let mut bitmask2 = bitmask2
  while true {
    let ib = bitmask1.ctz()
    let jb = bitmask2.ctz()
    if ib < jb {
      i += 1
      bitmask1 = bitmask1 & (bitmask1 - 1)
    } else if ib > jb {
      j += 1
      bitmask2 = bitmask2 & (bitmask2 - 1)
    } else {
      if ib == 32 {
        break
      }
      if (self._[i] & other._[j]) != self._[i] {
        return false
      }
      i += 1
      j += 1
      bitmask1 = bitmask1 & (bitmask1 - 1)
      bitmask2 = bitmask2 & (bitmask2 - 1)
    }
  }
  return true
}
