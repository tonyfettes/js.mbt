///|
pub fn test_array_int() -> @js.Array[Int] {
  let array : @js.Array[Int] = @js.Array::new()
  array.push(3)
  array
}

///|
pub fn test_array_float() -> @js.Array[Float] {
  let array : @js.Array[Float] = @js.Array::new()
  array.push(1.0)
  array.push(2.0)
  array.push(3.0)
  array
}

///|
pub fn test_array_double() -> @js.Array[Double] {
  let array : @js.Array[Double] = @js.Array::new()
  array.push(1.0)
  array.push(2.0)
  array.push(3.0)
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
