///|
pub extern type JSError

///|
type! Err JSError

///|
pub impl OfValue for Err with of_value(value : Value) -> Err! {
  Err(OfValue::of_value!(value))
}

///|
pub impl ToValue for Err with to_js_value(self : Err) -> Value {
  match self {
    Err(error) => error.to_js_value()
  }
}

///|
pub(open) trait ToError {
  to_js_error(self : Self) -> JSError
}

///|
impl OfValue for JSError with of_value(value : Value) -> JSError! {
  guard JSError::is_error(value) else { raise TypeError::new("Expected Error") }
  JSError::of_value(value)
}

///|
impl ToValue for JSError with to_js_value(self : JSError) -> Value {
  self.to_value()
}

///|
pub impl ToError for Value with to_js_error(self : Value) -> JSError {
  guard JSError::is_error(self) else {
    TypeError::new("Expected Error").to_js_error()
  }
  JSError::of_value(self)
}
