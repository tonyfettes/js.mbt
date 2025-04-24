///|
pub extern type Float32Array

///|
pub extern "js" fn Float32Array::new(length : Int) -> Float32Array =
  #|(length) => {
  #|  return new Float32Array(length);
  #|}

///|
pub extern "js" fn Float32Array::from_array_buffer(
  buffer : ArrayBuffer
) -> Float32Array =
  #|(buffer) => {
  #|  return new Float32Array(buffer);
  #|}

///|
pub extern "js" fn Float32Array::from_array(array : Array) -> Float32Array =
  #|(buffer) => {
  #|  return new Float32Array(buffer);
  #|}

///|
pub extern "js" fn Float32Array::length(self : Float32Array) -> Int =
  #|(array) => {
  #|  return array.length;
  #|}

///|
pub extern "js" fn Float32Array::op_set(
  self : Float32Array,
  offset : Int,
  value : Float
) =
  #|(array, offset, value) => {
  #|  array[offset] = value;
  #|}

///|
pub extern "js" fn Float32Array::op_get(
  self : Float32Array,
  offset : Int
) -> Float =
  #|(array, offset) => {
  #|  return array[offset];
  #|}

///|
pub extern "js" fn Float32Array::set(
  self : Float32Array,
  other : Float32Array,
  offset~ : Int = 0
) -> Unit =
  #|(self, other, offset) => {
  #|  self.set(other, offset);
  #|}

///|
extern "js" fn Float32Array::is_float32_array(value : Value) -> Bool =
  #|(value) => {
  #|  return value instanceof Float32Array;
  #|}

///|
extern "js" fn Float32Array::of_value(value : Value) -> Float32Array =
  #|(value) => {
  #|  return value;
  #|}

///|
pub impl ToValue for Float32Array with to_js_value(self) = "%identity"

///|
pub impl OfValue for Float32Array with of_value(value) {
  if Float32Array::is_float32_array(value) {
    Float32Array::of_value(value)
  } else {
    raise TypeError::new("Expected Float32Array")
  }
}

///|
pub extern "js" fn Float32Array::buffer(self : Float32Array) -> ArrayBuffer =
  #|(self) => self.buffer
