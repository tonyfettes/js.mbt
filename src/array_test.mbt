test "" {
  let array : @js.JsArray[Int] = @js.JsArray::new()
  @json.inspect!(array.length(), content=0)
}
