///|
pub extern type Int32Array

///|
pub extern "js" fn Int32Array::new(length : Int) -> Int32Array =
  #|(length) => {
  #|  return new Int32Array(length);
  #|}

///|
pub extern "js" fn Int32Array::from_array_buffer(
  buffer : ArrayBuffer
) -> Int32Array =
  #|(buffer) => {
  #|  return new Int32Array(buffer);
  #|}

///|
pub extern "js" fn Int32Array::from_array(array : Array) -> Int32Array =
  #|(buffer) => {
  #|  return new Int32Array(buffer);
  #|}

///|
pub extern "js" fn Int32Array::length(self : Int32Array) -> Int =
  #|(array) => {
  #|  return array.length;
  #|}

///|
pub extern "js" fn Int32Array::op_set(
  self : Int32Array,
  offset : Int,
  value : Int
) =
  #|(array, offset, value) => {
  #|  array[offset] = value;
  #|}

///|
pub extern "js" fn Int32Array::op_get(self : Int32Array, offset : Int) -> Int =
  #|(array, offset) => {
  #|  return array[offset];
  #|}

///|
pub extern "js" fn Int32Array::set(
  self : Int32Array,
  other : Int32Array,
  offset~ : Int = 0
) -> Unit =
  #|(self, other, offset) => {
  #|  self.set(other, offset);
  #|}
