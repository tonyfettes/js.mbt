///|
pub fn test_array() -> @js.Array[Int] {
  let array = @js.Array::new()
  array.push(3)
  array
}

///|
pub fn test_array_modify(array : @js.Array[Int]) -> Unit {
  array.push(4)
}

///|
pub fn test_int(value : @js.Value[Int]) -> Int {
  value.into()
}

///|
pub fn test_int_option(value : @js.Value[Int?]) -> Int {
  value.into().or(-1)
}
