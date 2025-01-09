test "JsArray::length" {
  let array : @js.JsArray[Int] = @js.JsArray::new()
  @json.inspect!(array.length(), content=0)
}

test "JsArray::push" {
  let array : @js.JsArray[Int] = @js.JsArray::new()
  array.push(1)
  array.push(2)
  array.push(3)
  @json.inspect!(array.length(), content=3)
}

test "JsArray::get" {
  let array : @js.JsArray[Double] = @js.JsArray::new()
  array.push(1.0)
  array.push(2.0)
  array.push(3.0)
  @json.inspect!(array[0], content=1.0)
  @json.inspect!(array[1], content=2.0)
  @json.inspect!(array[2], content=3.0)
}
