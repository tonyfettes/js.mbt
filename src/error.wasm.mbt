///|
fn JSError::is_error(value : Value) -> Bool = "tonyfettes:js/error" "is_error"

///|
fn JSError::of_value(value : Value) -> JSError = "tonyfettes:js/error" "identity"

///|
fn JSError::to_value(self : JSError) -> Value = "tonyfettes:js/error" "identity"
