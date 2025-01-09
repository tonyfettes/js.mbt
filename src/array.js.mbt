///|
pub typealias JsArray[T] = Array[T]

///|
extern "js" fn js_array_to_value(js_array : JsArray[Value]) -> Value =
  #|(js_array) => js_array

///|
pub impl[T] ToValue for JsArray[T] with to_value(self : JsArray[T]) -> Value {
  js_array_to_value(identity(self))
}
