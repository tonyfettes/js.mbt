///|
extern "js" fn JSTypeError::new(message : Str) -> JSTypeError =
  #|(message) => new TypeError(message)
