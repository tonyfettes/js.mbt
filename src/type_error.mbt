///|
extern type JSTypeError

///|
pub type! TypeError JSTypeError

///|
pub fn TypeError::new(message : String) -> TypeError {
  TypeError(JSTypeError::new(Str::of_string(message)))
}

///|
impl ToError for JSTypeError with to_js_error(self : JSTypeError) -> JSError = "%identity"

///|
pub impl ToError for TypeError with to_js_error(self : TypeError) -> JSError {
  match self {
    TypeError(error) => error.to_js_error()
  }
}
