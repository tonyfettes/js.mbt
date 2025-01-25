///|
pub type Null

///|
fn Null::null() -> Null = "tonyfettes:js/null" "null"

///|
pub let null : Null = Null::null()

///|
pub type Nullable[_]

///|
fn Nullable::_is_null(self : Nullable[Object]) -> Bool = "tonyfettes:js/null" "is_null"

///|
pub fn Nullable::to_option[T](self : Nullable[T]) -> T? {
  if Nullable::_is_null(identity(self)) {
    None
  } else {
    Some(identity(self))
  }
}
