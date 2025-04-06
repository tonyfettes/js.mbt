///|
pub extern type T

///|
fn _is(value : @value.T) -> Bool = "tonyfettes:js" "is_string"

///|
fn _of(value : @value.T) -> T = "tonyfettes:js" "identity"

///|
fn _to(self : T) -> @value.T = "tonyfettes:js" "identity"

///|
pub impl @value.To for T with of_value(value : @value.T) -> T? {
  guard _is(value) else { return None }
  Some(_of(value))
}

///|
pub impl @value.Of for T with to_value(self : T) -> @value.T {
  _to(self)
}

///|
pub fn length(self : T) -> Int = "tonyfettes:js/string" "length"

///|
fn char_code_at(self : T, index : Int) -> Char = "tonyfettes:js/string" "char_code_at"

///|
pub fn equal(self : T, other : T) -> Bool = "tonyfettes:js/string" "equal"

///|
pub impl Eq for T with op_equal(self : T, other : T) -> Bool {
  equal(self, other)
}

///|
fn make(array : @array.T) -> T = "tonyfettes:js/string" "make"

///|
pub fn of_string(string : String) -> T {
  let js_array = @array.new()
  for char in string {
    js_array.push(char)
  }
  make(js_array)
}

///|
pub fn T::of_string(string : String) -> T {
  of_string(string)
}

///|
pub fn to_string(self : T) -> String {
  let string = StringBuilder::new()
  for i in 0..<length(self) {
    string.write_char(char_code_at(self, i))
  }
  string.to_string()
}
