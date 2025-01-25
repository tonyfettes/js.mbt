///|
fn Value::cast[T, U](self : Value[T]) -> Value[U] = "%identity"

///|
type Value[_]

///|
fn Value::null() -> Value[Unit] = "tonyfettes:js" "null"

///|
fn Value::_is_null(self : Value[Unit]) -> Bool = "tonyfettes:js" "isNull"

///|
fn Value::_is_undefined(self : Value[Unit]) -> Bool = "tonyfettes:js" "isUndefined"

///|
fn Value::is_null[T](self : Value[T]) -> Bool {
  self.cast()._is_null()
}

///|
fn Value::is_undefined[T](self : Value[T]) -> Bool {
  self.cast()._is_undefined()
}

///|
trait Into {
  into(Value[Self]) -> Self
}

///|
pub fn Value::into[T : Into](self : Value[T]) -> T {
  T::into(self)
}

///|
trait From {
  from(Self) -> Value[Self]
}

///|
pub fn Value::from[T : From](self : T) -> Value[T] {
  T::from(self)
}

///|
fn Value::to_int(self : Value[Int]) -> Int = "tonyfettes:js" "identity"

///|
pub impl Into for Int with into(self : Value[Int]) -> Int {
  Value::to_int(self)
}

///|
fn Value::of_int(self : Int) -> Value[Int] = "tonyfettes:js" "identity"

///|
pub impl From for Int with from(self : Int) -> Value[Int] {
  Value::of_int(self)
}

///|
fn Value::to_double(self : Value[Double]) -> Double = "tonyfettes:js" "identity"

///|
fn Value::of_double(self : Double) -> Value[Double] = "tonyfettes:js" "identity"

///|
fn Value::to_bool(self : Value[Bool]) -> Bool = "tonyfettes:js" "identity"

///|
fn Value::of_bool(self : Bool) -> Value[Bool] = "tonyfettes:js" "identity"

///|
pub impl[T : Into] Into for T? with into(self : Value[T?]) -> T? {
  if self.is_null() || self.is_undefined() {
    None
  } else {
    Some(self.cast().into())
  }
}

///|
pub impl[T : From] From for T? with from(self : T?) -> Value[T?] {
  match self {
    None => Value::null().cast()
    Some(value) => T::from(value).cast()
  }
}

///|
fn Value::to_array(self : Value[Array[Unit]]) -> Array[Unit] = "tonyfettes:js" "identity"

///|
fn Value::of_array(self : Array[Unit]) -> Value[Array[Unit]] = "tonyfettes:js" "identity"

///|
pub impl[T : Into] Into for Array[T] with into(self : Value[Array[T]]) -> Array[
  T,
] {
  Value::to_array(self.cast()).cast()
}

///|
pub impl[T : From] From for Array[T] with from(self : Array[T]) -> Value[
  Array[T],
] {
  Value::of_array(self.cast()).cast()
}
