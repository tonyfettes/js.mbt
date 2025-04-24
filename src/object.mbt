///|
pub extern type Object

///|
pub impl OfValue for Object with of_value(value : Value) -> Object! {
  guard Object::is_object(value) else {
    raise TypeError::new("Expected an object")
  }
  Object::of_value(value)
}

///|
pub impl ToValue for Object with to_js_value(self : Object) -> Value = "%identity"

///|
pub(open) trait ToObject {
  to_js_object(Self) -> Object
}

///|
pub(open) trait OfObject {
  to(Object) -> Self!
}

///|
pub fn Object::to[To : OfObject](self : Object) -> To! {
  To::to!(self)
}
