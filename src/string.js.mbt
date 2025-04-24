///|
pub extern type Str

///|
extern "js" fn Str::is_string(value : Value) -> Bool =
  #|(object) => typeof object === "string"

///|
fn Str::of_value(value : Value) -> Str = "%identity"

///|
pub fn Str::of_string(string : String) -> Str = "%identity"

///|
pub fn Str::to_string(self : Str) -> String = "%identity"

///|
pub impl OfValue for Str with of_value(value : Value) -> Str! {
  guard Str::is_string(value) else { raise TypeError::new("Expected a string") }
  Str::of_value(value)
}

///|
pub impl ToValue for Str with to_js_value(self : Str) -> Value = "%identity"

///|
pub extern "js" fn Str::length(self : Str) -> Int =
  #|(self) => self.length

///|
pub extern "js" fn Str::equal(self : Str, other : Str) -> Bool =
  #|(self, other) => self === other

///|
pub impl Eq for Str with op_equal(self : Str, other : Str) -> Bool {
  Str::equal(self, other)
}
