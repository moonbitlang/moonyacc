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
test "@small_int_set.add/basic" {
  let empty = @small_int_set.empty()
  let s1 = @small_int_set.add(empty, 0)
  inspect!(@small_int_set.contains(s1, 0), content="true")
  let s2 = @small_int_set.add(s1, 1)
  inspect!(@small_int_set.contains(s2, 0), content="true")
  inspect!(@small_int_set.contains(s2, 1), content="true")
}

///|
test "@small_int_set.is_empty" {
  // Test empty set
  let empty = @small_int_set.empty()
  inspect!(empty.is_empty(), content="true")

  // Test non-empty set by adding elements
  let nonempty = empty.add(1)
  inspect!(nonempty.is_empty(), content="false")

  // Test set after removing all elements
  let removed = nonempty.remove(1)
  inspect!(removed.is_empty(), content="true")
}

///|
test "@small_int_set.iter/empty" {
  // Test iterating over an empty set
  let empty_set = @small_int_set.empty()
  let elements = empty_set.iter().to_array()
  inspect!(elements, content="[]")
}

///|
test "@small_int_set.singleton/boundary" {
  // Test minimum reasonable input
  let set0 = @small_int_set.singleton(0)
  inspect!(@small_int_set.contains(set0, 0), content="true")
  inspect!(@small_int_set.contains(set0, 1), content="false")

  // Test boundary of first word
  let set31 = @small_int_set.singleton(31)
  inspect!(@small_int_set.contains(set31, 31), content="true")
  inspect!(@small_int_set.contains(set31, 30), content="false")

  // Test start of second word
  let set32 = @small_int_set.singleton(32)
  inspect!(@small_int_set.contains(set32, 32), content="true")
  inspect!(@small_int_set.contains(set32, 31), content="false")
}

///|
test "@small_int_set.iter/single_word" {
  // Test iterating over elements in a single word (0-31)
  let mut set = @small_int_set.empty()
  set = @small_int_set.add(set, 0)
  set = @small_int_set.add(set, 1)
  set = @small_int_set.add(set, 31)
  let elements = set.iter().to_array()
  inspect!(elements, content="[0, 1, 31]")
}

///|
test "@small_int_set.iter/singleton" {
  let set = @small_int_set.singleton(64)
  let elements = set.iter().to_array()
  inspect!(elements, content="[64]")
}

///|
test "@small_int_set.iter/multi_word" {
  // Test iterating over elements spanning multiple words (crossing 32-bit boundary)
  let mut set = @small_int_set.empty()
  set = @small_int_set.add(set, 31)
  set = @small_int_set.add(set, 32)
  set = @small_int_set.add(set, 63)
  let elements = set.iter().to_array()
  inspect!(elements, content="[31, 32, 63]")
}

///|
test "@small_int_set.from_iter/basic" {
  let set = @small_int_set.from_iter([1, 2, 3].iter())
  inspect!(set.contains(1), content="true")
  inspect!(set.contains(2), content="true")
  inspect!(set.contains(3), content="true")
  inspect!(set.contains(4), content="false")
}

///|
test "@small_int_set.from_iter/empty" {
  let set = @small_int_set.from_iter(Iter::empty())
  inspect!(set.is_empty(), content="true")
}

///|
test "@small_int_set.from_iter/multi_word" {
  // Test with numbers that span multiple words (32-bit boundaries)
  let set = @small_int_set.from_iter([31, 32, 33, 64].iter())
  inspect!(set.contains(31), content="true")
  inspect!(set.contains(32), content="true")
  inspect!(set.contains(33), content="true")
  inspect!(set.contains(64), content="true")
  inspect!(set.contains(34), content="false")
}

///|
test "@small_int_set.add/word_boundary" {
  let empty = @small_int_set.empty()
  let s1 = @small_int_set.add(empty, 31)
  let s2 = @small_int_set.add(s1, 32)
  inspect!(@small_int_set.contains(s2, 31), content="true")
  inspect!(@small_int_set.contains(s2, 32), content="true")
  inspect!(@small_int_set.contains(s2, 33), content="false")
}

///|
test "@small_int_set.add/idempotent" {
  let empty = @small_int_set.empty()
  let s1 = @small_int_set.add(empty, 5)
  let s2 = @small_int_set.add(s1, 5)
  inspect!(@small_int_set.contains(s1, 5), content="true")
  inspect!(@small_int_set.contains(s2, 5), content="true")
}

///|
test "@small_int_set.remove" {
  // Test basic remove functionality
  let set = @small_int_set.empty()
  let set1 = @small_int_set.add(set, 5)
  let set2 = @small_int_set.add(set1, 10)
  let result = @small_int_set.remove(set2, 5)
  inspect!(@small_int_set.contains(result, 5), content="false")
  inspect!(@small_int_set.contains(result, 10), content="true")
}

///|
test "@small_int_set.remove" {
  // Test removing the last element in a word
  let set = @small_int_set.singleton(1)
  inspect!(@small_int_set.remove(set, 1), content="{}")

  // Test removing an element from a word that has multiple elements
  let set2 = @small_int_set.singleton(1).add(2)
  inspect!(@small_int_set.remove(set2, 1), content="{2}")

  // Test removing a non-existent element
  let set3 = @small_int_set.singleton(1)
  inspect!(@small_int_set.remove(set3, 33), content="{1}")
}

///|
test "@small_int_set.remove/non_existent" {
  // Test removing non-existent element should return same set
  let set = @small_int_set.empty()
  let set1 = @small_int_set.add(set, 1)
  let result = @small_int_set.remove(set1, 42)
  inspect!(@small_int_set.contains(result, 1), content="true")
  // Test that removing non-existent element doesn't modify the set
  inspect!(@small_int_set.contains(set1, 1), content="true")
}

///|
test "@small_int_set.remove/boundary" {
  // Test removing elements at word boundaries
  let set = @small_int_set.empty()
  let set1 = @small_int_set.add(set, 31)
  let set2 = @small_int_set.add(set1, 32)
  let set3 = @small_int_set.add(set2, 33)
  let result = @small_int_set.remove(set3, 32)
  inspect!(@small_int_set.contains(result, 31), content="true")
  inspect!(@small_int_set.contains(result, 32), content="false")
  inspect!(@small_int_set.contains(result, 33), content="true")
}

///|
test "@small_int_set.union/empty_sets" {
  let empty = @small_int_set.empty()
  let result = @small_int_set.union(empty, empty)

  // Empty union should contain no elements
  for i = 0; i < 32; i = i + 1 {
    inspect!(@small_int_set.contains(result, i), content="false")
  }
}

///|
test "@small_int_set.union/disjoint_sets" {
  let set1 = @small_int_set.empty()
    |> @small_int_set.add(1)
    |> @small_int_set.add(3)
  let set2 = @small_int_set.empty()
    |> @small_int_set.add(2)
    |> @small_int_set.add(4)
  let union = @small_int_set.union(set1, set2)
  inspect!(@small_int_set.contains(union, 1), content="true")
  inspect!(@small_int_set.contains(union, 2), content="true")
  inspect!(@small_int_set.contains(union, 3), content="true")
  inspect!(@small_int_set.contains(union, 4), content="true")
  inspect!(@small_int_set.contains(union, 5), content="false")
}

///|
test "@small_int_set.union/overlapping_sets" {
  let set1 = @small_int_set.empty()
    |> @small_int_set.add(1)
    |> @small_int_set.add(2)
  let set2 = @small_int_set.empty()
    |> @small_int_set.add(2)
    |> @small_int_set.add(3)
  let union = @small_int_set.union(set1, set2)
  inspect!(@small_int_set.contains(union, 1), content="true")
  inspect!(@small_int_set.contains(union, 2), content="true")
  inspect!(@small_int_set.contains(union, 3), content="true")
  inspect!(@small_int_set.contains(union, 4), content="false")
}

///|
test "@small_int_set.union" {
  // Case 1: Tests when ib < jb
  // Create a set with elements that will have a lower word index
  let set1 = @small_int_set.singleton(1)
  // Create a set with elements that will have a higher word index
  let set2 = @small_int_set.singleton(64)
  let union1 = @small_int_set.union(set1, set2)
  // Both elements should be in the union
  inspect!(@small_int_set.contains(union1, 1), content="true")
  inspect!(@small_int_set.contains(union1, 64), content="true")

  // Case 2: Tests when ib > jb
  // Now test with sets in reverse order
  let union2 = @small_int_set.union(set2, set1)
  // Should get the same result regardless of order
  inspect!(@small_int_set.contains(union2, 1), content="true")
  inspect!(@small_int_set.contains(union2, 64), content="true")

  // Case 3: Tests when elements are in same word (ib = jb)
  let set3 = @small_int_set.singleton(2)
  let union3 = @small_int_set.union(set1, set3)
  inspect!(@small_int_set.contains(union3, 1), content="true")
  inspect!(@small_int_set.contains(union3, 2), content="true")
}

///|
test "@small_int_set.intersection/empty_sets" {
  let empty = @small_int_set.empty()
  let result = @small_int_set.intersection(empty, empty)
  // Empty set intersection with empty set should give empty set
  // Test by checking no elements from 0 to 31 exist
  for i = 0; i < 32; i = i + 1 {
    inspect!(@small_int_set.contains(result, i), content="false")
  }
}

///|
test "@small_int_set.intersection/disjoint_sets" {
  // Create two sets with no common elements
  let set1 = @small_int_set.add(@small_int_set.empty(), 1)
    |> @small_int_set.add(3)
    |> @small_int_set.add(5)
  let set2 = @small_int_set.add(@small_int_set.empty(), 2)
    |> @small_int_set.add(4)
    |> @small_int_set.add(6)
  let result = @small_int_set.intersection(set1, set2)
  // Test that no elements from either set exist in the intersection
  let test_values = [1, 2, 3, 4, 5, 6]
  for i = 0; i < test_values.length(); i = i + 1 {
    inspect!(@small_int_set.contains(result, test_values[i]), content="false")
  }
}

///|
test "@small_int_set.intersection/overlapping_sets" {
  // Create two sets with some common elements
  let set1 = @small_int_set.add(@small_int_set.empty(), 1)
    |> @small_int_set.add(2)
    |> @small_int_set.add(3)
  let set2 = @small_int_set.add(@small_int_set.empty(), 2)
    |> @small_int_set.add(3)
    |> @small_int_set.add(4)
  let result = @small_int_set.intersection(set1, set2)
  // Test common elements are present
  inspect!(@small_int_set.contains(result, 2), content="true")
  inspect!(@small_int_set.contains(result, 3), content="true")
  // Test non-common elements are absent
  inspect!(@small_int_set.contains(result, 1), content="false")
  inspect!(@small_int_set.contains(result, 4), content="false")
}

///|
test "@small_int_set.intersection" {
  // Test case 1: Test when ib < jb
  // Create two sets where the first set has a smaller word index
  let set1 = @small_int_set.singleton(1) // This will set bit in first word
  let set2 = @small_int_set.singleton(33) // This will set bit in second word
  assert_eq!(set1.intersection(set2), @small_int_set.empty())

  // Test case 2: Test when ib > jb
  // Create two sets where the first set has a larger word index
  let set3 = @small_int_set.singleton(65) // This will set bit in third word
  let set4 = @small_int_set.singleton(33) // This will set bit in second word
  assert_eq!(set3.intersection(set4), @small_int_set.empty())

  // Test case 3: Test when we need to remove empty words
  // Create two sets with overlapping bits to test word removal
  let set5 = @small_int_set.singleton(1).add(2)
  let set6 = @small_int_set.singleton(2).add(3)
  assert_eq!(set5.intersection(set6), @small_int_set.singleton(2))
}

///|
test "@small_int_set.difference/empty_sets" {
  let empty = @small_int_set.empty()
  let result = @small_int_set.difference(empty, empty)
  // An empty set minus an empty set should contain no elements
  for i = 0; i < 32; i = i + 1 {
    inspect!(@small_int_set.contains(result, i), content="false")
  }
}

///|
test "@small_int_set.difference/disjoint_sets" {
  // Create two disjoint sets {0,1,2} and {3,4,5}
  let mut set1 = @small_int_set.empty()
  let mut set2 = @small_int_set.empty()
  for i = 0; i < 3; i = i + 1 {
    set1 = @small_int_set.add(set1, i)
  }
  for i = 3; i < 6; i = i + 1 {
    set2 = @small_int_set.add(set2, i)
  }
  let result = @small_int_set.difference(set1, set2)
  // The difference should contain all elements from set1
  for i = 0; i < 3; i = i + 1 {
    inspect!(@small_int_set.contains(result, i), content="true")
  }
  // And none from set2
  for i = 3; i < 6; i = i + 1 {
    inspect!(@small_int_set.contains(result, i), content="false")
  }
}

///|
test "@small_int_set.difference/overlapping_sets" {
  // Create two overlapping sets {0,1,2} and {1,2,3}
  let mut set1 = @small_int_set.empty()
  let mut set2 = @small_int_set.empty()
  for i = 0; i < 3; i = i + 1 {
    set1 = @small_int_set.add(set1, i)
  }
  for i = 1; i < 4; i = i + 1 {
    set2 = @small_int_set.add(set2, i)
  }
  let result = @small_int_set.difference(set1, set2)
  // The difference should only contain 0
  inspect!(@small_int_set.contains(result, 0), content="true")
  for i = 1; i < 4; i = i + 1 {
    inspect!(@small_int_set.contains(result, i), content="false")
  }
}

///|
test "@small_int_set.difference" {
  // Test case 1: when ib < jb
  // Create a set with element in lower word index and another with element in higher word index
  let set1 = @small_int_set.singleton(1) // word index 0
  let set2 = @small_int_set.singleton(64) // word index 2
  inspect!(@small_int_set.difference(set1, set2), content="{1}")

  // Test case 2: when ib > jb
  let set3 = @small_int_set.singleton(64) // word index 2
  let set4 = @small_int_set.singleton(1) // word index 0
  inspect!(@small_int_set.difference(set3, set4), content="{64}")

  // Test case 3: when result[k] == 0 and elements need to be removed
  // Create two sets with same word index but different bits
  let set5 = @small_int_set.singleton(32) // word index 1
  let set6 = @small_int_set.singleton(32) // word index 1
  inspect!(@small_int_set.difference(set5, set6), content="{}")
}

///|
test "@small_int_set.disjoint/empty_sets" {
  let empty1 = @small_int_set.empty()
  let empty2 = @small_int_set.empty()
  inspect!(@small_int_set.disjoint(empty1, empty2), content="true")
}

///|
test "@small_int_set.disjoint/non_overlapping" {
  // Create two sets with elements in different words (chunks of 32 bits)
  let mut set1 = @small_int_set.empty()
  set1 = @small_int_set.add(set1, 0)
  set1 = @small_int_set.add(set1, 1)
  let mut set2 = @small_int_set.empty()
  set2 = @small_int_set.add(set2, 33)
  set2 = @small_int_set.add(set2, 34)
  inspect!(@small_int_set.disjoint(set1, set2), content="true")
}

///|
test "@small_int_set.disjoint/overlapping" {
  let mut set1 = @small_int_set.empty()
  set1 = @small_int_set.add(set1, 5)
  set1 = @small_int_set.add(set1, 10)
  let mut set2 = @small_int_set.empty()
  set2 = @small_int_set.add(set2, 10)
  set2 = @small_int_set.add(set2, 15)
  inspect!(@small_int_set.disjoint(set1, set2), content="false")
}

///|
test "@small_int_set.disjoint" {
  // Test case 1: Sets with overlapping elements in the same word
  let set1 = @small_int_set.singleton(1).add(2)
  let set2 = @small_int_set.singleton(2).add(3)
  inspect!(@small_int_set.disjoint(set1, set2), content="false")

  // Test case 2: Sets with elements in different words
  let set3 = @small_int_set.singleton(1) // first word
  let set4 = @small_int_set.singleton(33) // second word
  inspect!(@small_int_set.disjoint(set3, set4), content="true")

  // Test case 3: Empty sets
  let empty1 = @small_int_set.empty()
  let empty2 = @small_int_set.empty()
  inspect!(@small_int_set.disjoint(empty1, empty2), content="true")
}

///|
test "@small_int_set.subset" {
  // Empty set is subset of any set
  let empty = @small_int_set.empty()
  let set1 = @small_int_set.from_iter([1, 2, 3].iter())
  inspect!(@small_int_set.subset(empty, set1), content="true")

  // Set is subset of itself
  inspect!(@small_int_set.subset(set1, set1), content="true")

  // Proper subset testing
  let set2 = @small_int_set.from_iter([1, 2].iter())
  inspect!(@small_int_set.subset(set2, set1), content="true")

  // Not a subset testing
  let set3 = @small_int_set.from_iter([1, 4].iter())
  inspect!(@small_int_set.subset(set3, set1), content="false")

  // Testing with elements across word boundaries (> 32)
  let large_set1 = @small_int_set.from_iter([1, 33, 65].iter())
  let large_set2 = @small_int_set.from_iter([1, 33, 65, 97].iter())
  inspect!(@small_int_set.subset(large_set1, large_set2), content="true")
  inspect!(@small_int_set.subset(large_set2, large_set1), content="false")
}

///|
test "@small_int_set.subset: bad case" {
  inspect!(
    @small_int_set.subset(
      @small_int_set.from_iter([64].iter()),
      @small_int_set.from_iter([21, 48, 58, 61, 81].iter()),
    ),
    content="false",
  )
}

///|
test "@small_int_set.is_singleton" {
  // Test with empty set
  let empty = @small_int_set.empty()
  inspect!(empty.is_singleton(0), content="false")

  // Test with singleton set
  let single = @small_int_set.singleton(42)
  inspect!(single.is_singleton(42), content="true")
  inspect!(single.is_singleton(0), content="false")

  // Test with multiple elements
  let multi = @small_int_set.singleton(1).add(2)
  inspect!(multi.is_singleton(1), content="false")
  inspect!(multi.is_singleton(2), content="false")
}

///|
test "@small_int_set.is_singleton/boundary" {
  // Test with boundary values for word index and bit position
  let max_word = @small_int_set.singleton(31) // last bit in first word
  inspect!(max_word.is_singleton(31), content="true")
  let min_next_word = @small_int_set.singleton(32) // first bit in second word
  inspect!(min_next_word.is_singleton(32), content="true")
}
