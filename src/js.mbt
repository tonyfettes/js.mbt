///|
pub type Value[_]

///|
fn Value::cast[T, U](self : Value[T]) -> Value[U] = "%identity"

///|
fn Value::unwrap[T](self : Value[T]) -> T = "%identity"

///|
fn Value::wrap[T](self : T) -> Value[T] = "%identity"

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
pub(open) trait Into {
  into(Value[Self]) -> Self
}

///|
impl Into with into(value : Value[Self]) -> Self { value.unwrap() }

///|
pub fn Value::into[T : Into](self : Value[T]) -> T {
  T::into(self)
}

///|
pub(open) trait From {
  from(Self) -> Value[Self]
}

///|
impl From with from(value : Self) -> Value[Self] { Value::wrap(value) }

///|
pub fn Value::from[T : From](self : T) -> Value[T] {
  T::from(self)
}

///|
fn Value::to_bool(self : Value[Bool]) -> Bool = "tonyfettes:js" "identity"

///|
fn Value::to_int(self : Value[Int]) -> Int = "tonyfettes:js" "identity"

///|
fn Value::to_float(self : Value[Float]) -> Float = "tonyfettes:js" "identity"

///|
fn Value::to_double(self : Value[Double]) -> Double = "tonyfettes:js" "identity"

///|
fn Value::of_bool(self : Bool) -> Value[Bool] = "tonyfettes:js" "identity"

///|
fn Value::of_int(self : Int) -> Value[Int] = "tonyfettes:js" "identity"

///|
fn Value::of_float(self : Float) -> Value[Float] = "tonyfettes:js" "identity"

///|
fn Value::of_double(self : Double) -> Value[Double] = "tonyfettes:js" "identity"

///|
pub impl Into for Bool with into(self : Value[Bool]) -> Bool {
  Value::to_bool(self)
}

///|
pub impl Into for Int with into(self : Value[Int]) -> Int {
  Value::to_int(self)
}

///|
pub impl Into for Float with into(self : Value[Float]) -> Float {
  Value::to_float(self)
}

///|
pub impl Into for Double with into(self : Value[Double]) -> Double {
  Value::to_double(self)
}

///|
pub impl From for Bool with from(self : Bool) -> Value[Bool] {
  Value::of_bool(self)
}

///|
pub impl From for Int with from(self : Int) -> Value[Int] {
  Value::of_int(self)
}

///|
pub impl From for Float with from(self : Float) -> Value[Float] {
  Value::of_float(self)
}

///|
pub impl From for Double with from(self : Double) -> Value[Double] {
  Value::of_double(self)
}

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
