///|
type T[K, V] @hashmap2.T[K, Array[V]]

///|
pub fn new[K, V]() -> T[K, V] {
  @hashmap2.new(capacity=16)
}

///|
pub fn add[K : Hash + Eq, V : Eq](self : T[K, V], key : K, value : V) -> Unit {
  let arr = self._.get_or_init(key, fn(_) { [] })
  if not(arr.contains(value)) {
    arr.push(value)
  }
}

///|
pub fn get[K : Hash + Eq, V](self : T[K, V], key : K) -> Array[V] {
  self._.get(key).or([])
}

///|
pub impl[K : Eq + Hash + Show, V : ToJson] ToJson for T[K, V] with to_json(self) {
  Map::from_iter(self._.iter()).to_json()
}

///|
pub fn copy[K : Hash + Eq, V](self : T[K, V]) -> T[K, V] {
  let map2 = @hashmap2.new(capacity=16)
  for entry in self._.iter() {
    map2.set(entry.0, entry.1)
  }
  T(map2)
}
