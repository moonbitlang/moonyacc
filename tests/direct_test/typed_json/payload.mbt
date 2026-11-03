///|
pub(all) struct Payload {
  value : Int32
}

///|
let conversions : Ref[Int32] = Ref(0)

///|
pub impl ToJson for Payload with fn to_json(self) {
  conversions.val += 1
  Json(self.value)
}

///|
pub extend Payload with ToJson::{to_json}
