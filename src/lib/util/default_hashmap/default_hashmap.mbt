///|
pub typealias DefaultHashMap as T

///|
struct DefaultHashMap[K, V] {
  map : @hashmap.T[K, V]
  default_fn : (K) -> V
}

///|
pub fn[K, V] new(default_fn : (K) -> V) -> T[K, V] {
  DefaultHashMap::{ map: @hashmap.new(), default_fn }
}

///|
pub fn[K : Eq + Hash, V] get(self : T[K, V], key : K) -> V {
  self.map.get_or_init(key, fn() { (self.default_fn)(key) })
}
