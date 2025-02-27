///|
pub typealias T[K, V] = DefaultHashMap[K, V]

///|
struct DefaultHashMap[K, V] {
  map : @hashmap.T[K, V]
  default_fn : (K) -> V
}

///|
pub fn new[K, V](default_fn : (K) -> V) -> T[K, V] {
  DefaultHashMap::{ map: @hashmap.new(), default_fn }
}

///|
pub fn get[K : Eq + Hash, V](self : T[K, V], key : K) -> V {
  self.map.get_or_init(key, fn() { (self.default_fn)(key) })
}
