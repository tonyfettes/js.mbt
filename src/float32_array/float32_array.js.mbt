///|
pub extern type T

///|
pub extern "js" fn new(length : Int) -> T =
  #|(length) => {
  #|  return new Float32Array(length);
  #|}

///|
pub extern "js" fn T::new(length : Int) -> T =
  #|(length) => {
  #|  return new Float32Array(length);
  #|}

///|
pub extern "js" fn from_array_buffer(buffer : @array_buffer.T) -> T =
  #|(buffer) => {
  #|  return new Float32Array(buffer);
  #|}

///|
pub extern "js" fn T::from_array_buffer(buffer : @array_buffer.T) -> T =
  #|(buffer) => {
  #|  return new Float32Array(buffer);
  #|}

///|
pub extern "js" fn from_array(array : @array.T) -> T =
  #|(buffer) => {
  #|  return new Float32Array(buffer);
  #|}

///|
pub extern "js" fn T::from_array(array : @array.T) -> T =
  #|(buffer) => {
  #|  return new Float32Array(buffer);
  #|}

///|
pub extern "js" fn length(array : T) -> Int =
  #|(array) => {
  #|  return array.length;
  #|}

///|
pub extern "js" fn T::length(self : T) -> Int =
  #|(array) => {
  #|  return array.length;
  #|}

///|
pub extern "js" fn T::op_set(self : T, offset : Int, value : Float) =
  #|(array, offset, value) => {
  #|  array[offset] = value;
  #|}

///|
pub extern "js" fn T::op_get(self : T, offset : Int) -> Float =
  #|(array, offset) => {
  #|  return array[offset];
  #|}

///|
pub extern "js" fn T::set(self : T, other : T, offset~ : Int = 0) -> Unit =
  #|(self, other, offset) => {
  #|  self.set(other, offset);
  #|}
