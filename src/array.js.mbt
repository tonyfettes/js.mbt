///|
fn Array::of_value_array(array : @builtin.Array[Value]) -> Array = "%identity"

///|
fn Array::to_value_array(self : Array) -> @builtin.Array[Value] = "%identity"

///|
pub fn Array::new() -> Array {
  Array::of_value_array([])
}

///|
extern "js" fn Array::is_array(object : Object) -> Bool =
  #|(object) => {
  #|  return Array.isArray(object);
  #|}

///|
fn Array::of_object(object : Object) -> Array = "%identity"

///|
fn Array::push_value(self : Array, value : Value) -> Unit {
  self.to_value_array().push(value)
}

///|
fn Array::set_value(self : Array, index : Int, value : Value) -> Unit {
  self.to_value_array()[index] = value
}

///|
fn Array::get_value(self : Array, index : Int) -> Value {
  self.to_value_array()[index]
}

///|
pub fn Array::length(self : Array) -> Int {
  self.to_value_array().length()
}

///|
pub fn Array::iter(self : Array) -> Iter[Value] {
  self.to_value_array().iter()
}
