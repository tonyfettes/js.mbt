///|
pub fn float32_array_from_buffer(buffer : @js.ArrayBuffer) -> @js.Float32Array {
  return @js.Float32Array::from_array_buffer(buffer)
}

///|
pub fn float32_array_length(array : @js.Float32Array) -> Int {
  return array.length()
}

///|
pub fn float32_array_get(array : @js.Float32Array, offset : Int) -> Float {
  return array[offset]
}

///|
pub fn float32_array_set(
  array : @js.Float32Array,
  offset : Int,
  value : Float
) -> Unit {
  array[offset] = value
}
