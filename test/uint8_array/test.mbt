///|
pub fn uint8_array_from_buffer(buffer : @js.ArrayBuffer) -> @js.Uint8Array {
  return @js.Uint8Array::from_array_buffer(buffer)
}

///|
pub fn uint8_array_length(array : @js.Uint8Array) -> Int {
  return array.length()
}

///|
pub fn uint8_array_get(array : @js.Uint8Array, offset : Int) -> Byte {
  return array[offset]
}

///|
pub fn uint8_array_set(
  array : @js.Uint8Array,
  offset : Int,
  value : Byte
) -> Unit {
  array[offset] = value
}
