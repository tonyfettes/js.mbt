///|
pub fn test_array_int() -> @array.T {
  let array : @js.Array = @js.Array::new()
  array.push(3)
  array
}

///|
pub fn test_array_float() -> @js.Array {
  let array : @js.Array = @js.Array::new()
  array.push(1.0)
  array.push(2.0)
  array.push(3.0)
  array
}

///|
pub fn test_array_double() -> @js.Array {
  let array : @js.Array = @js.Array::new()
  array.push(1.0)
  array.push(2.0)
  array.push(3.0)
  array
}

///|
pub fn test_array_modify(array : @js.Array) -> Unit {
  array.push(4)
}

///|
pub fn test_int(value : @js.Value) -> Int {
  value.to().or(-1)
}

///|
pub fn test_is_null(value : @js.Value) -> Bool {
  value.is_null()
}
