///|
pub extern "js" fn Object::new() -> Object =
  #|() => ({})

///|
extern "js" fn Object::op_set_ffi(
  self : Object,
  key : Value,
  value : Value
) -> Unit =
  #|(self, key, value) => {
  #|  self[key] = value
  #|}

///|
pub fn Object::op_set[Key : ToValue, Value : ToValue](
  self : Object,
  key : Key,
  value : Value
) -> Unit {
  Object::op_set_ffi(self, key.to_js_value(), value.to_js_value())
}

///|
extern "js" fn Object::op_get_ffi(self : Object, key : Value) -> Value =
  #|(self, key) => {
  #|  return self[key];
  #|}

///|
pub fn Object::op_get[Key : ToValue](self : Object, key : Key) -> Value {
  Object::op_get_ffi(self, key.to_js_value())
}

///|
extern "js" fn Object::is_object(value : Value) -> Bool =
  #|(object) => typeof object === "object" && object !== null

///|
fn Object::of_value(value : Value) -> Object = "%identity"
