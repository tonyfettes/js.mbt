///|
pub extern type Str

///|
fn Str::is_string(value : Value) -> Bool = "tonyfettes:js" "is_string"

///|
fn Str::of_value(value : Value) -> Str = "tonyfettes:js" "identity"

///|
fn Str::to_value(self : Str) -> Value = "tonyfettes:js" "identity"

///|
pub impl OfValue for Str with of_value(value : Value) -> Str! {
  guard Str::is_string(value) else {
    raise TypeError::new("Expected a string value")
  }
  Str::of_value(value)
}

///|
pub impl ToValue for Str with to_js_value(self : Str) -> Value {
  Str::to_value(self)
}

///|
pub fn Str::length(self : Str) -> Int = "tonyfettes:js/string" "length"

///|
fn Str::char_code_at(self : Str, index : Int) -> Char = "tonyfettes:js/string" "char_code_at"

///|
pub fn Str::equal(self : Str, other : Str) -> Bool = "tonyfettes:js/string" "equal"

///|
pub impl Eq for Str with op_equal(self : Str, other : Str) -> Bool {
  Str::equal(self, other)
}

///|
fn Str::make(array : Array) -> Str = "tonyfettes:js/string" "make"

///|
pub fn Str::of_string(string : String) -> Str {
  let js_array = Array::new()
  for char in string {
    js_array.push(char)
  }
  Str::make(js_array)
}

///|
pub fn Str::to_string(self : Str) -> String {
  let string = StringBuilder::new()
  for i in 0..<self.length() {
    string.write_char(self.char_code_at(i))
  }
  string.to_string()
}
