///|
pub extern type T

///|
fn _of_value_array(array : Array[@value.T]) -> T = "%identity"

///|
fn _to_value_array(self : T) -> Array[@value.T] = "%identity"

///|
pub fn T::new() -> T {
  _of_value_array([])
}

///|
extern "js" fn _is(object : @object.T) -> Bool =
  #|(object) => {
  #|  return Array.isArray(object);
  #|}

///|
extern "js" fn _of_object(object : @object.T) -> T = "%identity"

///|
pub impl @object.To for T with to(value : @object.T) -> T? {
  guard _is(value) else { return None }
  Some(_of_object(value))
}

///|
pub impl @object.Of for T with to_object(self : T) -> @object.T = "%identity"

///|
pub impl @value.To for T with to(value : @value.T) -> T? {
  guard value.to() is Some((object : @object.T)) else { return None }
  object.to()
}

///|
pub impl @value.Of for T with to_value(self : T) -> @value.T {
  self.to_object().to_value()
}

///|
fn T::push_value(self : T, value : @value.T) -> Unit {
  self._to_value_array().push(value)
}

///|
fn T::set_value(self : T, index : Int, value : @value.T) -> Unit {
  self._to_value_array()[index] = value
}

///|
fn T::get_value(self : T, index : Int) -> @value.T {
  self._to_value_array()[index]
}

///|
pub fn T::length(self : T) -> Int {
  self._to_value_array().length()
}

///|
pub fn T::iter(self : T) -> Iter[@value.T] {
  self._to_value_array().iter()
}
