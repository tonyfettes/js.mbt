///|
pub type JsArray[_]

///|
fn JsArray::_new() -> JsArray[Object] = "tonyfettes:js/array" "new"

///|
pub fn JsArray::new[T]() -> JsArray[T] {
  JsArray::_new() |> identity
}

///|
pub fn JsArray::of[T : JsArrayPush](values : Array[T]) -> JsArray[T] {
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
pub(open) trait JsArrayPush {
  push(JsArray[Self], Self) -> Unit
}

///|
fn JsArray::_push_object(self : JsArray[Object], value : Object) -> Unit = "tonyfettes:js/array" "push"

///|
impl JsArrayPush with push(self : JsArray[Self], value : Self) -> Unit {
  JsArray::_push_object(identity(self), identity(value))
}

///|
fn JsArray::_push_int(self : JsArray[Int], value : Int) -> Unit = "tonyfettes:js/array" "push"

///|
pub impl JsArrayPush for Int with push(self : JsArray[Int], value : Int) -> Unit {
  JsArray::_push_int(identity(self), value)
}

///|
fn JsArray::_push_double(self : JsArray[Double], value : Double) -> Unit = "tonyfettes:js/array" "push"

///|
pub impl JsArrayPush for Double with push(
  self : JsArray[Double],
  value : Double
) -> Unit {
  JsArray::_push_double(identity(self), value)
}

///|
fn JsArray::_push_bool(self : JsArray[Bool], value : Bool) -> Unit = "tonyfettes:js/array" "push"

///|
pub impl JsArrayPush for Bool with push(self : JsArray[Bool], value : Bool) -> Unit {
  JsArray::_push_bool(identity(self), value)
}

///|
pub fn JsArray::push[T : JsArrayPush](self : JsArray[T], value : T) -> Unit {
  T::push(self, value)
}

///|
pub(open) trait JsArrayGet {
  get(JsArray[Self], Int) -> Self
}

///|
fn JsArray::_get_object(self : JsArray[Object], index : Int) -> Object = "tonyfettes:js/array" "get"

///|
impl JsArrayGet with get(self : JsArray[Self], index : Int) -> Self {
  JsArray::_get_object(identity(self), index) |> identity
}

///|
fn JsArray::_get_int(self : JsArray[Int], index : Int) -> Int = "tonyfettes:js/array" "get"

///|
impl JsArrayGet for Int with get(self : JsArray[Int], index : Int) -> Int {
  JsArray::_get_int(identity(self), index)
}

///|
fn JsArray::_get_float(self : JsArray[Float], index : Int) -> Float = "tonyfettes:js/array" "get"

///|
impl JsArrayGet for Float with get(self : JsArray[Float], index : Int) -> Float {
  JsArray::_get_float(identity(self), index)
}

///|
fn JsArray::_get_double(self : JsArray[Double], index : Int) -> Double = "tonyfettes:js/array" "get"

///|
impl JsArrayGet for Double with get(self : JsArray[Double], index : Int) -> Double {
  JsArray::_get_double(identity(self), index)
}

///|
pub fn JsArray::op_get[T : JsArrayGet](self : JsArray[T], index : Int) -> T {
  T::get(self, index)
}
