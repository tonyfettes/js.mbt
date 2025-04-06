///|
pub extern type T

///|
pub fn new() -> T = "tonyfettes:js/array" "new"

///|
pub fn T::new() -> T = "tonyfettes:js/array" "new"

///|
fn _is(object : @object.T) -> Bool = "tonyfettes:js/array" "is_array"

///|
fn _of_object(object : @object.T) -> T = "tonyfettes:js" "identity"

///|
fn T::push_value(self : T, value : @value.T) -> Unit = "tonyfettes:js/array" "push"

///|
fn T::set_value(self : T, index : Int, value : @value.T) -> Unit = "tonyfettes:js/array" "set"

///|
fn T::get_value(self : T, index : Int) -> @value.T = "tonyfettes:js/array" "get"

///|
pub fn T::length(self : T) -> Int = "tonyfettes:js/array" "length"

///|
pub fn T::iter(self : T) -> Iter[@value.T] {
  Iter::new(fn(yield_) {
    for i in 0..<self.length() {
      match yield_(self.get_value(i)) {
        IterEnd => break IterEnd
        IterContinue => continue
      }
    } else {
      IterContinue
    }
  })
}
