///|
pub fn test_array() -> @js.Array[Int] {
  let js_array = @js.Array::new()
  js_array.push(3)
  js_array
}
