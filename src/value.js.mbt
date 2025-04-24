///|
pub extern "js" fn Value::null() -> Value =
  #|() => null

///|
pub extern "js" fn Value::undefined() -> Value =
  #|() => undefined

///|
pub extern "js" fn Value::is_null(self : Value) -> Bool =
  #|(self) => self === null

///|
pub extern "js" fn Value::is_undefined(self : Value) -> Bool =
  #|(self) => self === undefined

///|
pub extern "js" fn Value::is_boolean(self : Value) -> Bool =
  #|(self) => typeof self === "boolean"

///|
pub extern "js" fn Value::is_number(self : Value) -> Bool =
  #|(self) => typeof self === "number"

///|
fn Value::as_bool(self : Value) -> Bool = "%identity"

///|
fn Value::as_int(self : Value) -> Int = "%identity"

///|
fn Value::as_uint(self : Value) -> UInt = "%identity"

///|
fn Value::as_int16(self : Value) -> Int16 = "%identity"

///|
fn Value::as_uint16(self : Value) -> UInt16 = "%identity"

///|
fn Value::as_int64(self : Value) -> Int64 {
  self.as_double().to_int64()
}

///|
fn Value::as_uint64(self : Value) -> UInt64 {
  self.as_double().to_uint64()
}

///|
fn Value::as_char(self : Value) -> Char = "%identity"

///|
fn Value::as_float(self : Value) -> Float = "%identity"

///|
fn Value::as_double(self : Value) -> Double = "%identity"

///|
fn Value::of_bool(self : Bool) -> Value = "%identity"

///|
fn Value::of_int(self : Int) -> Value = "%identity"

///|
fn Value::of_uint(self : UInt) -> Value = "%identity"

///|
fn Value::of_int16(self : Int16) -> Value = "%identity"

///|
fn Value::of_uint16(self : UInt16) -> Value = "%identity"

///|
fn Value::of_int64(self : Int64) -> Value {
  Value::of_double(self.to_double())
}

///|
fn Value::of_uint64(self : UInt64) -> Value {
  Value::of_double(self.to_double())
}

///|
fn Value::of_char(self : Char) -> Value = "%identity"

///|
fn Value::of_float(self : Float) -> Value = "%identity"

///|
fn Value::of_double(self : Double) -> Value = "%identity"
