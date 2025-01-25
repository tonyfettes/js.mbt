///|
pub type Undefined

///|
fn Undefined::undefined() -> Undefined = "tonyfettes:js/undefined" "undefined"

///|
pub let undefined : Undefined = Undefined::undefined()

pub type Undefinable[_]

///|
fn Undefinable::_is_undefined(self : Undefinable[Object]) -> Bool = "tonyfettes:js/undefined" "is_undefined"

///|
pub fn Undefinable::to_option[T](self : Undefinable[T]) -> T? {
  if Undefinable::_is_undefined(identity(self)) {
    None
  } else {
    Some(identity(self))
  }
}
