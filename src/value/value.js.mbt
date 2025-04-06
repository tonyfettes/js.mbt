///|
pub extern "js" fn null() -> T =
  #|() => null

///|
pub extern "js" fn T::is_null(self : T) -> Bool =
  #|(self) => self === null

///|
pub extern "js" fn T::is_undefined(self : T) -> Bool =
  #|(self) => self === undefined

///|
pub extern "js" fn T::is_boolean(self : T) -> Bool =
  #|(self) => typeof self === "boolean"

///|
pub extern "js" fn T::is_number(self : T) -> Bool =
  #|(self) => typeof self === "number"

///|
fn T::to_bool(self : T) -> Bool = "%identity"

///|
fn T::to_int(self : T) -> Int = "%identity"

///|
fn T::to_char(self : T) -> Char = "%identity"

///|
fn T::to_float(self : T) -> Float = "%identity"

///|
fn T::to_double(self : T) -> Double = "%identity"

///|
fn T::of_bool(self : Bool) -> T = "%identity"

///|
fn T::of_int(self : Int) -> T = "%identity"

///|
fn T::of_char(self : Char) -> T = "%identity"

///|
fn T::of_float(self : Float) -> T = "%identity"

///|
fn T::of_double(self : Double) -> T = "%identity"
