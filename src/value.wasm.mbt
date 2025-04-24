///|
pub fn Value::null() -> Value = "tonyfettes:js" "null"

///|
pub fn Value::undefined() -> Value = "tonyfettes:js" "undefined"

///|
pub fn Value::is_null(self : Value) -> Bool = "tonyfettes:js" "is_null"

///|
pub fn Value::is_undefined(self : Value) -> Bool = "tonyfettes:js" "is_undefined"

///|
pub fn Value::is_boolean(self : Value) -> Bool = "tonyfettes:js" "is_boolean"

///|
pub fn Value::is_number(self : Value) -> Bool = "tonyfettes:js" "is_number"

///|
fn Value::as_bool(self : Value) -> Bool = "tonyfettes:js" "identity"

///|
fn Value::as_int(self : Value) -> Int = "tonyfettes:js" "identity"

///|
fn Value::as_uint(self : Value) -> UInt = "tonyfettes:js" "identity"

///|
fn Value::as_int64(self : Value) -> Int64 = "tonyfettes:js" "identity"

///|
fn Value::as_uint64(self : Value) -> UInt64 = "tonyfettes:js" "identity"

///|
fn Value::as_char(self : Value) -> Char = "tonyfettes:js" "identity"

///|
fn Value::as_float(self : Value) -> Float = "tonyfettes:js" "identity"

///|
fn Value::as_double(self : Value) -> Double = "tonyfettes:js" "identity"

///|
fn Value::of_bool(self : Bool) -> Value = "tonyfettes:js" "identity"

///|
fn Value::of_int(self : Int) -> Value = "tonyfettes:js" "identity"

///|
fn Value::of_uint(self : UInt) -> Value = "tonyfettes:js" "identity"

///|
fn Value::of_int64(self : Int64) -> Value = "tonyfettes:js" "identity"

///|
fn Value::of_uint64(self : UInt64) -> Value = "tonyfettes:js" "identity"

///|
fn Value::of_char(self : Char) -> Value = "tonyfettes:js" "identity"

///|
fn Value::of_float(self : Float) -> Value = "tonyfettes:js" "identity"

///|
fn Value::of_double(self : Double) -> Value = "tonyfettes:js" "identity"
