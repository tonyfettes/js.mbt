///|
pub fn T::new() -> T = "tonyfettes:js/object" "new"

///|
pub fn T::op_set(self : T, key : @string.T, value : @value.T) -> Unit = "tonyfettes:js/object" "op_set"

///|
pub fn T::op_get(self : T, key : @string.T) -> @value.T = "tonyfettes:js/object" "op_get"

///|
fn _is(value : @value.T) -> Bool = "tonyfettes:js" "is_object"

///|
fn _to(value : @value.T) -> T = "%identity"
