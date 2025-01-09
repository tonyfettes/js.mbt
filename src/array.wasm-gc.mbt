///|
pub type JsArray[_]

///|
pub impl[T] ToValue for JsArray[T] with to_value(self : JsArray[T]) -> Value {
  Value::Object(identity(self))
}

///|
fn JsArray::_new() -> JsArray[Object] = "tonyfettes:js/array" "new"

///|
pub fn JsArray::new[T]() -> JsArray[T] {
  JsArray::_new() |> identity
}

///|
pub fn JsArray::of[T : ToValue](values : Array[T]) -> JsArray[T] {
  let array = JsArray::new()
  for value in values {
    JsArray::push(array, value)
  }
  array
}

///|
fn JsArray::_length(self : JsArray[Object]) -> Int = "tonyfettes:js/array" "length"

///|
pub fn JsArray::length[T](self : JsArray[T]) -> Int {
  JsArray::_length(identity(self))
}

///|
fn JsArray::_push(self : JsArray[Object], value : Object) -> Unit = "tonyfettes:js/array" "push"

///|
fn JsArray::_push_int(self : JsArray[Int], value : Int) -> Unit = "tonyfettes:js/array" "push"

///|
fn JsArray::_push_float(self : JsArray[Float], value : Float) -> Unit = "tonyfettes:js/array" "push"

///|
fn JsArray::_push_double(self : JsArray[Double], value : Double) -> Unit = "tonyfettes:js/array" "push"

///|
fn JsArray::_push_bool(self : JsArray[Bool], value : Bool) -> Unit = "tonyfettes:js/array" "push"

///|
pub fn JsArray::push[T : ToValue](self : JsArray[T], value : T) -> Unit {
  match value.to_value() {
    Bool(value) => JsArray::_push_bool(identity(self), value)
    Int(value) => JsArray::_push_int(identity(self), value)
    Double(value) => JsArray::_push_double(identity(self), value)
    Object(value) => JsArray::_push(identity(self), value)
  }
}
