///|
pub extern type Int32Array

///|
pub fn Int32Array::new(length : Int) -> Int32Array = "tonyfettes:js/int32_array" "new"

///|
pub fn Int32Array::from_array_buffer(buffer : ArrayBuffer) -> Int32Array = "tonyfettes:js/int32_array" "from_array_buffer"

///|
pub fn Int32Array::from_array(array : Array) -> Int32Array = "tonyfettes:js/int32_array" "from_array"

///|
pub fn Int32Array::length(self : Int32Array) -> Int = "tonyfettes:js/typed_array" "length"

///|
pub fn Int32Array::op_set(self : Int32Array, offset : Int, value : Int) = "tonyfettes:js/typed_array" "op_set"

///|
pub fn Int32Array::op_get(self : Int32Array, offset : Int) -> Int = "tonyfettes:js/typed_array" "op_get"

///|
pub fn Int32Array::set(
  self : Int32Array,
  other : Int32Array,
  offset~ : Int = 0
) = "tonyfettes:js/typed_array" "set"
