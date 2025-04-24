///|
pub extern type Uint8Array

///|
pub fn Uint8Array::new(length : Int) -> Uint8Array = "tonyfettes:js/uint8_array" "new"

///|
pub fn Uint8Array::from_array_buffer(array : ArrayBuffer) -> Uint8Array = "tonyfettes:js/uint8_array" "from_array_buffer"

///|
pub fn Uint8Array::from_array(array : Array) -> Uint8Array = "tonyfettes:js/uint8_array" "from_array"

///|
pub fn Uint8Array::to_bytes(self : Uint8Array) -> Bytes {
  let buffer = @buffer.new()
  let length = self.length()
  for i in 0..<length {
    buffer.write_byte(self[i])
  }
  buffer.contents()
}

///|
pub fn Uint8Array::length(self : Uint8Array) -> Int = "tonyfettes:js/typed_array" "length"

///|
pub fn Uint8Array::op_set(self : Uint8Array, offset : Int, value : Byte) = "tonyfettes:js/typed_array" "op_set"

///|
pub fn Uint8Array::op_get(self : Uint8Array, offset : Int) -> Byte = "tonyfettes:js/typed_array" "op_get"

///|
pub fn Uint8Array::set(
  self : Uint8Array,
  other : Uint8Array,
  offset~ : Int = 0
) -> Unit = "tonyfettes:js/typed_array" "set"
