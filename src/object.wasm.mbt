///|
pub fn Object::new() -> Object = "tonyfettes:js/object" "new"

///|
fn Object::op_set_value(self : Object, key : Value, value : Value) -> Unit = "tonyfettes:js/object" "op_set"

///|
pub fn Object::op_set[Key : ToValue, Value : ToValue](
  self : Object,
  key : Key,
  value : Value
) -> Unit {
  Object::op_set_value(self, key.to_js_value(), value.to_js_value())
}

///|
fn Object::op_get_value(self : Object, key : Value) -> Value = "tonyfettes:js/object" "op_get"

///|
pub fn Object::op_get[Key : ToValue](self : Object, key : Key) -> Value {
  Object::op_get_value(self, key.to_js_value())
}

///|
fn Object::is_object(value : Value) -> Bool = "tonyfettes:js" "is_object"

///|
fn Object::of_value(value : Value) -> Object = "%identity"
