///|
pub extern type T

///|
pub extern "js" fn new() -> T =
  #|() => {
  #|  return new ArrayBuffer();
  #|}

///|
pub extern "js" fn T::new() -> T =
  #|() => {
  #|  return new ArrayBuffer();
  #|}
