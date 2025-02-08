///|
fn Value::cast[T, U](self : Value[T]) -> Value[U] = "%identity"

///|
fn Value::unwrap[T](self : Value[T]) -> T = "%identity"

///|
fn Value::wrap[T](self : T) -> Value[T] = "%identity"

///|
pub fn Value::is_null[T](self : Value[T]) -> Bool {
  self.cast()._is_null()
}

///|
pub fn Value::is_undefined[T](self : Value[T]) -> Bool {
  self.cast()._is_undefined()
}

///|
pub fn Value::call[T : From, R : Into](self : Value[(T) -> R], arg0 : T) -> R {
  self.cast()._call(T::from(arg0).cast()).cast() |> R::into()
}

///|
pub fn Value::call2[A : From, B : From, R : Into](
  self : Value[(A, B) -> R],
  arg0 : A,
  arg1 : B
) -> R {
  let arg0 = A::from(arg0).cast()
  let arg1 = B::from(arg1).cast()
  let result = self.cast()._call2(arg0, arg1).cast()
  R::into(result)
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
pub impl Into for Unit with into(self : Value[Unit]) -> Unit { ignore(self) }

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
    None => Value::_null().cast()
    Some(value) => T::from(value).cast()
  }
}
