///|
pub fn null() -> T = "tonyfettes:js" "null"

///|
pub fn T::is_null(self : T) -> Bool = "tonyfettes:js" "is_null"

///|
pub fn T::is_undefined(self : T) -> Bool = "tonyfettes:js" "is_undefined"

///|
pub fn T::is_boolean(self : T) -> Bool = "tonyfettes:js" "is_boolean"

///|
pub fn T::is_number(self : T) -> Bool = "tonyfettes:js" "is_number"

///|
fn T::to_bool(self : T) -> Bool = "tonyfettes:js" "identity"

///|
fn T::to_int(self : T) -> Int = "tonyfettes:js" "identity"

///|
fn T::to_char(self : T) -> Char = "tonyfettes:js" "identity"

///|
fn T::to_float(self : T) -> Float = "tonyfettes:js" "identity"

///|
fn T::to_double(self : T) -> Double = "tonyfettes:js" "identity"

///|
fn T::of_bool(self : Bool) -> T = "tonyfettes:js" "identity"

///|
fn T::of_int(self : Int) -> T = "tonyfettes:js" "identity"

///|
fn T::of_char(self : Char) -> T = "tonyfettes:js" "identity"

///|
fn T::of_float(self : Float) -> T = "tonyfettes:js" "identity"

///|
fn T::of_double(self : Double) -> T = "tonyfettes:js" "identity"
