///|
pub type Array[_]

///|
fn Array::_new() -> Array[Object] = "tonyfettes:js/array" "new"

///|
pub fn Array::new[T]() -> Array[T] {
  Array::_new() |> identity
}

///|
pub fn Array::of[T : ArrayPush](values : @builtin.Array[T]) -> Array[T] {
  let array = Array::new()
  for value in values {
    Array::push(array, value)
  }
  array
}

///|
fn Array::_length(self : Array[Object]) -> Int = "tonyfettes:js/array" "length"

///|
pub fn Array::length[T](self : Array[T]) -> Int {
  Array::_length(identity(self))
}

///|
pub(open) trait ArrayPush {
  push(Array[Self], Self) -> Unit
}

///|
fn Array::push_object(self : Array[Object], value : Object) -> Unit = "tonyfettes:js/array" "push"

///|
impl ArrayPush with push(self : Array[Self], value : Self) -> Unit {
  Array::push_object(identity(self), identity(value))
}

///|
fn Array::push_int(self : Array[Int], value : Int) -> Unit = "tonyfettes:js/array" "push"

///|
pub impl ArrayPush for Int with push(self : Array[Int], value : Int) -> Unit {
  Array::push_int(identity(self), value)
}

///|
fn Array::push_double(self : Array[Double], value : Double) -> Unit = "tonyfettes:js/array" "push"

///|
pub impl ArrayPush for Double with push(self : Array[Double], value : Double) -> Unit {
  Array::push_double(identity(self), value)
}

///|
fn Array::push_bool(self : Array[Bool], value : Bool) -> Unit = "tonyfettes:js/array" "push"

///|
pub impl ArrayPush for Bool with push(self : Array[Bool], value : Bool) -> Unit {
  Array::push_bool(identity(self), value)
}

///|
pub fn Array::push[T : ArrayPush](self : Array[T], value : T) -> Unit {
  T::push(self, value)
}

///|
pub(open) trait ArrayGet {
  get(Array[Self], Int) -> Self
}

///|
fn Array::get_object(self : Array[Object], index : Int) -> Object = "tonyfettes:js/array" "get"

///|
impl ArrayGet with get(self : Array[Self], index : Int) -> Self {
  Array::get_object(identity(self), index) |> identity
}

///|
fn Array::get_int(self : Array[Int], index : Int) -> Int = "tonyfettes:js/array" "get"

///|
impl ArrayGet for Int with get(self : Array[Int], index : Int) -> Int {
  Array::get_int(identity(self), index)
}

///|
fn Array::get_float(self : Array[Float], index : Int) -> Float = "tonyfettes:js/array" "get"

///|
impl ArrayGet for Float with get(self : Array[Float], index : Int) -> Float {
  Array::get_float(identity(self), index)
}

///|
fn Array::get_double(self : Array[Double], index : Int) -> Double = "tonyfettes:js/array" "get"

///|
impl ArrayGet for Double with get(self : Array[Double], index : Int) -> Double {
  Array::get_double(identity(self), index)
}

///|
pub fn Array::op_get[T : ArrayGet](self : Array[T], index : Int) -> T {
  T::get(self, index)
}
