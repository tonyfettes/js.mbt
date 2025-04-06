///|
pub extern type T

///|
pub extern "js" fn new(length : Int) -> T =
  #|(length) => {
  #|  return new Uint8Array(length);
  #|}

///|
pub extern "js" fn T::new(length : Int) -> T =
  #|(length) => {
  #|  return new Uint8Array(length);
  #|}

///|
pub extern "js" fn from_array_buffer(array : @array_buffer.T) -> T =
  #|(array) => {
  #|  return new Uint8Array(array);
  #|}

///|
pub extern "js" fn T::from_array_buffer(array : @array_buffer.T) -> T =
  #|(array) => {
  #|  return new Uint8Array(array);
  #|}

///|
pub extern "js" fn from_array(array : @array.T) -> T =
  #|(array) => {
  #|  return new Uint8Array(array);
  #|}

///|
pub extern "js" fn T::from_array(array : @array.T) -> T =
  #|(array) => {
  #|  return new Uint8Array(array);
  #|}

///|
pub extern "js" fn length(self : T) -> Int =
  #|(array) => {
  #|  return array.length;
  #|}

///|
pub extern "js" fn T::op_set(self : T, offset : Int, value : Byte) =
  #|(array, offset, value) => {
  #|  array[offset] = value;
  #|}

///|
pub extern "js" fn T::op_get(self : T, offset : Int) -> Byte =
  #|(array, offset) => {
  #|  return array[offset];
  #|}
