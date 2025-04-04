///|
pub extern type T

///|
extern "js" fn _is(value : @value.T) -> Bool =
  #|(object) => typeof object === "string"

///|
extern "js" fn _of(value : @value.T) -> T = "%identity"

///|
pub impl @value.To for T with to(value : @value.T) -> T? {
  guard _is(value) else { return None }
  Some(_of(value))
}

///|
pub impl @value.Of for T with to_value(self : T) -> @value.T = "%identity"

///|
pub extern "js" fn length(self : T) -> Int =
  #|(self) => self.length

///|
pub extern "js" fn equal(self : T, other : T) -> Bool =
  #|(self, other) => self === other

///|
pub impl Eq for T with op_equal(self : T, other : T) -> Bool {
  equal(self, other)
}

///|
pub extern "js" fn to_string(self : T) -> String = "%identity"
