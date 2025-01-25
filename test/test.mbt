///|
pub fn test_array() -> @js.Array[Int] {
  let array = @js.Array::new()
  array.push(3)
  array
}

///|
pub fn test_int(value : @js.Value[Int]) -> Int {
  value.into()
}
