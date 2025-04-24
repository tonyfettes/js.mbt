///|
pub extern type Float32Array

///|
pub fn Float32Array::new(length : Int) -> Float32Array = "tonyfettes:js/float32_array" "new"

///|
pub fn Float32Array::from_array_buffer(buffer : ArrayBuffer) -> Float32Array = "tonyfettes:js/float32_array" "from_array_buffer"

///|
pub fn Float32Array::from_array(array : Array) -> Float32Array = "tonyfettes:js/float32_array" "from_array"

///|
pub fn Float32Array::length(self : Float32Array) -> Int = "tonyfettes:js/typed_array" "length"

///|
pub fn Float32Array::op_set(self : Float32Array, offset : Int, value : Float) = "tonyfettes:js/typed_array" "op_set"

///|
pub fn Float32Array::op_get(self : Float32Array, offset : Int) -> Float = "tonyfettes:js/typed_array" "op_get"

///|
pub fn Float32Array::set(
  self : Float32Array,
  other : Float32Array,
  offset~ : Int = 0
) = "tonyfettes:js/typed_array" "set"

///|
fn Float32Array::is_float32_array(value : Value) -> Bool = "tonyfettes:js/float32_array" "is_float32_array"

///|
fn Float32Array::of_value(value : Value) -> Float32Array = "tonyfettes:js" "identity"

///|
fn Float32Array::to_value(self : Float32Array) -> Value = "tonyfettes:js" "identity"

///|
pub impl ToValue for Float32Array with to_js_value(self) {
  self.to_value()
}

///|
pub impl OfValue for Float32Array with of_value(value : Value) {
  if Float32Array::is_float32_array(value) {
    Float32Array::of_value(value)
  } else {
    raise TypeError::new("Expected Float32Array")
  }
}

pub fn Float32Array::buffer(self : Float32Array) -> ArrayBuffer = "tonyfettes:js/float32_array" "buffer"
