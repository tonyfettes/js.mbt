///|
pub type Value[_]

///|
extern "js" fn Value::_null() -> Value[Unit] =
  #|() => null

///|
extern "js" fn Value::_is_null(self : Value[Unit]) -> Bool =
  #|(self) => self === null

///|
extern "js" fn Value::_is_undefined(self : Value[Unit]) -> Bool =
  #|(self) => self === undefined

///|
extern "js" fn Value::_call(
  self : Value[Unit],
  arg0 : Value[Unit]
) -> Value[Unit] =
  #|(self, arg0) => self(arg0)

///|
extern "js" fn Value::_call2(
  self : Value[Unit],
  arg0 : Value[Unit],
  arg1 : Value[Unit]
) -> Value[Unit] =
  #|(self, arg0, arg1) => self(arg0, arg1)

///|
fn Value::to_bool(self : Value[Bool]) -> Bool = "%identity"

///|
fn Value::to_int(self : Value[Int]) -> Int = "%identity"

///|
fn Value::to_float(self : Value[Float]) -> Float = "%identity"

///|
fn Value::to_double(self : Value[Double]) -> Double = "%identity"

///|
fn Value::of_bool(self : Bool) -> Value[Bool] = "%identity"

///|
fn Value::of_int(self : Int) -> Value[Int] = "%identity"

///|
fn Value::of_float(self : Float) -> Value[Float] = "%identity"

///|
fn Value::of_double(self : Double) -> Value[Double] = "%identity"
