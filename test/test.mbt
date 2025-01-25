///|
pub fn test_array() -> @js.Array[Int] {
  let array = @js.Array::new()
  array.push(3)
  array
}

///|
pub fn test_nullable_some(value : @js.Value[Int]) -> String {
  value.into().to_string()
}
