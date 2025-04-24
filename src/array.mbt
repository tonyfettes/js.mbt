///|
pub extern type Array

///|
pub impl OfObject for Array with to(value : Object) -> Array! {
  guard Array::is_array(value) else {
    raise TypeError::new("Expected an array")
  }
  Array::of_object(value)
}

///|
pub impl ToObject for Array with to_js_object(self : Array) -> Object = "%identity"

///|
pub impl OfValue for Array with of_value(value : Value) -> Array! {
  value.to_js_object!().to!()
}

///|
pub impl ToValue for Array with to_js_value(self : Array) -> Value {
  self.to_js_object().to_js_value()
}

///|
pub fn Array::op_set[Value : ToValue](
  self : Array,
  index : Int,
  value : Value
) -> Unit {
  self.set_value(index, value.to_js_value())
}

///|
pub fn Array::op_get(self : Array, index : Int) -> Value {
  self.get_value(index)
}

///|
pub fn Array::push[Value : ToValue](self : Array, value : Value) -> Unit {
  self.push_value(value.to_js_value())
}

///|
pub fn Array::of_array[Value : ToValue](array : @builtin.Array[Value]) -> Array {
  let js_array = Array::new()
  for value in array {
    js_array.push_value(value.to_js_value())
  }
  js_array
}

///|
pub fn Array::of_fixed_array[Value : ToValue](
  array : FixedArray[Value]
) -> Array {
  let js_array = Array::new()
  for value in array {
    js_array.push_value(value.to_js_value())
  }
  js_array
}

///|
pub fn Array::to_array[Value : OfValue](self : Array) -> @builtin.Array[Value]! {
  let array = []
  for i in 0..<self.length() {
    array.push(Value::of_value!(self.get_value(i)))
  }
  array
}

///|
pub(open) trait ToArray {
  to_js_array(Self) -> Array
}

///|
pub impl[T : ToValue] ToArray for @builtin.Array[T] with to_js_array(
  self : @builtin.Array[T]
) -> Array {
  Array::of_array(self)
}

///|
pub impl[T : ToValue] ToArray for FixedArray[T] with to_js_array(
  self : FixedArray[T]
) -> Array {
  Array::of_fixed_array(self)
}

///|
pub impl[T : ToValue] ToArray for @immut/array.T[T] with to_js_array(
  self : @immut/array.T[T]
) -> Array {
  Array::of_array(self.to_array())
}

///|
pub impl[T : ToValue] ToArray for @immut/list.T[T] with to_js_array(
  self : @immut/list.T[T]
) -> Array {
  Array::of_array(self.to_array())
}
