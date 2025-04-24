///|
pub fn Array::new() -> Array = "tonyfettes:js/array" "new"

///|
fn Array::is_array(object : Object) -> Bool = "tonyfettes:js/array" "is_array"

///|
fn Array::of_object(object : Object) -> Array = "tonyfettes:js" "identity"

///|
fn Array::push_value(self : Array, value : Value) -> Unit = "tonyfettes:js/array" "push"

///|
fn Array::set_value(self : Array, index : Int, value : Value) -> Unit = "tonyfettes:js/array" "op_set"

///|
fn Array::get_value(self : Array, index : Int) -> Value = "tonyfettes:js/array" "op_get"

///|
pub fn Array::length(self : Array) -> Int = "tonyfettes:js/array" "length"

///|
pub fn Array::iter(self : Array) -> Iter[Value] {
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
