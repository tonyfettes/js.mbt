///|
type Object

///|
enum Value {
  Bool(Bool)
  Int(Int)
  Double(Double)
  Object(Object)
}

///|
pub(open) trait ToValue {
  to_value(Self) -> Value
}

///|
impl ToValue with to_value(self : Self) -> Value {
  Value::Object(identity(self))
}

///|
pub impl ToValue for Bool with to_value(self : Bool) -> Value {
  Value::Bool(self)
}

///|
pub impl ToValue for Int with to_value(self : Int) -> Value { Value::Int(self) }

///|
pub impl ToValue for Double with to_value(self : Double) -> Value {
  Value::Double(self)
}

///|
pub impl[T : ToValue] ToValue for FixedArray[T] with to_value(
  self : FixedArray[T]
) -> Value {
  let js_array = JsArray::new()
  for value in self {
    JsArray::push(js_array, value)
  }
  js_array.to_value()
}

///|
fn identity[T, U](value : T) -> U = "%identity"
