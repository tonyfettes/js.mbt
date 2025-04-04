///|
pub extern "js" fn T::new() -> T =
  #|() => ({})

///|
pub extern "js" fn T::op_set(
  self : T,
  key : @string.T,
  value : @value.T
) -> Unit =
  #|(self, key, value) => {
  #|  self[key] = value
  #|}

///|
pub extern "js" fn T::op_get(self : T, key : @string.T) -> @value.T =
  #|(self, key) => {
  #|  return self[key];
  #|}

///|
extern "js" fn _is(value : @value.T) -> Bool =
  #|(object) => typeof object === "object" && object !== null

///|
fn _to(value : @value.T) -> T = "%identity"
