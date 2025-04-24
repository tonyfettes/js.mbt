///|
pub extern type ArrayBuffer

///|
pub extern "js" fn ArrayBuffer::new() -> ArrayBuffer =
  #|() => {
  #|  return new ArrayBuffer();
  #|}
