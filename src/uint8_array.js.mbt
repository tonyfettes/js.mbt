///|
pub extern type Uint8Array

///|
pub extern "js" fn Uint8Array::new(length : Int) -> Uint8Array =
  #|(length) => {
  #|  return new Uint8Array(length);
  #|}

///|
pub extern "js" fn Uint8Array::from_array_buffer(
  array : ArrayBuffer
) -> Uint8Array =
  #|(array) => {
  #|  return new Uint8Array(array);
  #|}

///|
pub extern "js" fn Uint8Array::from_array(array : Array) -> Uint8Array =
  #|(array) => {
  #|  return new Uint8Array(array);
  #|}

///|
pub fn Uint8Array::to_bytes(self : Uint8Array) -> Bytes = "%identity"

///|
pub extern "js" fn Uint8Array::length(self : Uint8Array) -> Int =
  #|(array) => {
  #|  return array.length;
  #|}

///|
pub extern "js" fn Uint8Array::op_set(
  self : Uint8Array,
  offset : Int,
  value : Byte
) =
  #|(array, offset, value) => {
  #|  array[offset] = value;
  #|}

///|
pub extern "js" fn Uint8Array::op_get(self : Uint8Array, offset : Int) -> Byte =
  #|(array, offset) => {
  #|  return array[offset];
  #|}

///|
pub extern "js" fn Uint8Array::set(
  self : Uint8Array,
  other : Uint8Array,
  offset~ : Int = 0
) -> Unit =
  #|(self, other, offset) => {
  #|  self.set(other, offset);
  #|}
