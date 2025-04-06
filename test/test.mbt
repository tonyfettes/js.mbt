///|
pub fn test_int(value : @js.Value) -> Int {
  value.to().or(-1)
}

///|
pub fn test_is_null(value : @js.Value) -> Bool {
  value.is_null()
}
