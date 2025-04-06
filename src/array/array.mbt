///|
pub impl @object.To for T with to(value : @object.T) -> T? {
  guard _is(value) else { return None }
  Some(_of_object(value))
}

///|
pub impl @object.Of for T with to_object(self : T) -> @object.T = "%identity"

///|
pub impl @value.To for T with of_value(value : @value.T) -> T? {
  guard value.to() is Some((object : @object.T)) else { return None }
  object.to()
}

///|
pub impl @value.Of for T with to_value(self : T) -> @value.T {
  self.to_object().to_value()
}

///|
pub fn T::op_set(self : T, index : Int, value : @value.T) -> Unit {
  self.set_value(index, value)
}

///|
pub fn T::op_get(self : T, index : Int) -> @value.T {
  self.get_value(index)
}

///|
pub fn T::push[Value : @value.Of](self : T, value : Value) -> Unit {
  self.push_value(value.to_value())
}

///|
pub fn of_array[Value : @value.Of](array : Array[Value]) -> T {
  T::of_array(array)
}

pub fn T::of_array[Value : @value.Of](array : Array[Value]) -> T {
  let js_array = new()
  for value in array {
    js_array.push_value(value.to_value())
  }
  js_array
}

pub fn T::of_fixed_array[Value : @value.Of](array : FixedArray[Value]) -> T {
  let js_array = new()
  for value in array {
    js_array.push_value(value.to_value())
  }
  js_array
}

///|
pub fn T::to_array[Value : @value.To](self : T) -> Array[Value?] {
  let array = []
  for i in 0..<self.length() {
    array.push(self.get_value(i).to())
  }
  array
}
