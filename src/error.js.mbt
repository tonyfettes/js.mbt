///|
extern "js" fn JSError::is_error(value : Value) -> Bool =
  #|(value) {
  #|  return value instanceof Error
  #|}

///|
fn JSError::of_value(value : Value) -> JSError = "%identity"

///|
fn JSError::to_value(self : JSError) -> Value = "%identity"
