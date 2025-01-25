///|
pub type Array[_]

///|
fn Array::cast[T, U](self : Array[T]) -> Array[U] = "%identity"

///|
fn Array::_new() -> Array[Unit] = "tonyfettes:js/array" "new"

///|
pub fn Array::new[T]() -> Array[T] {
  Array::_new().cast()
}

///|
pub fn Array::of[T : From](values : @builtin.Array[T]) -> Array[T] {
  let array = Array::new()
  for value in values {
    Array::push(array, value)
  }
  array
}

///|
pub fn Array::to[T : Into](self : Array[T]) -> @builtin.Array[T] {
  let array = []
  for i in 0..<self.length() {
    array.push(array[i])
  }
  array
}

///|
fn Array::_length(self : Array[Unit]) -> Int = "tonyfettes:js/array" "length"

///|
pub fn Array::length[T](self : Array[T]) -> Int {
  Array::_length(self.cast())
}

///|
fn Array::_push(self : Array[Unit], value : Value[Unit]) -> Unit = "tonyfettes:js/array" "push"

///|
pub fn Array::push[T : From](self : Array[T], value : T) -> Unit {
  Array::_push(self.cast(), T::from(value).cast())
}

///|
fn Array::_get(self : Array[Unit], index : Int) -> Value[Unit] = "tonyfettes:js/array" "get"

///|
pub fn Array::get[T : Into](self : Array[T], index : Int) -> T {
  Array::_get(self.cast(), index).cast().into()
}

///|
pub fn Array::op_get[T : Into](self : Array[T], index : Int) -> T {
  self.get(index)
}

///|
fn Array::_set(self : Array[Unit], index : Int, value : Value[Unit]) -> Unit = "tonyfettes:js/array" "set"

///|
pub fn Array::set[T : From](self : Array[T], index : Int, value : T) -> Unit {
  Array::_set(self.cast(), index, T::from(value).cast())
}

///|
pub fn Array::op_set[T : From](self : Array[T], index : Int, value : T) -> Unit {
  self.set(index, value)
}
