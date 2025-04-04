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
pub fn T::of_array[Value : @value.Of](self : Array[Value]) -> T {
  let js_array = T::new()
  for value in self {
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
