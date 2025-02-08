///|
pub type Value[_]

///|
fn Value::_null() -> Value[Unit] = "tonyfettes:js" "null"

///|
fn Value::_is_null(self : Value[Unit]) -> Bool = "tonyfettes:js" "isNull"

///|
fn Value::_is_undefined(self : Value[Unit]) -> Bool = "tonyfettes:js" "isUndefined"

///|
fn Value::_call(self : Value[Unit], arg0 : Value[Unit]) -> Value[Unit] = "tonyfettes:js" "call"

///|
fn Value::_call2(
  self : Value[Unit],
  arg0 : Value[Unit],
  arg1 : Value[Unit]
) -> Value[Unit] = "tonyfettes:js" "call"

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
