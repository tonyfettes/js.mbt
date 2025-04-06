///|
pub fn int32_array_from_buffer(buffer : @js.ArrayBuffer) -> @js.Int32Array {
  return @js.Int32Array::from_array_buffer(buffer)
}

///|
pub fn int32_array_length(array : @js.Int32Array) -> Int {
  return array.length()
}

///|
pub fn int32_array_get(array : @js.Int32Array, offset : Int) -> Int {
  return array[offset]
}

///|
pub fn int32_array_set(
  array : @js.Int32Array,
  offset : Int,
  value : Int
) -> Unit {
  array[offset] = value
}
