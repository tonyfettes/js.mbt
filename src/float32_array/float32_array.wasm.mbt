///|
pub extern type T

///|
pub fn new(length : Int) -> T = "tonyfettes:js/float32_array" "new"

///|
pub fn T::new(length : Int) -> T = "tonyfettes:js/float32_array" "new"

///|
pub fn from_array_buffer(buffer : @array_buffer.T) -> T = "tonyfettes:js/float32_array" "from_array_buffer"

///|
pub fn T::from_array_buffer(buffer : @array_buffer.T) -> T = "tonyfettes:js/float32_array" "from_array_buffer"

///|
pub fn from_array(array : @array.T) -> T = "tonyfettes:js/float32_array" "from_array"

///|
pub fn T::from_array(array : @array.T) -> T = "tonyfettes:js/float32_array" "from_array"

///|
pub fn length(self : T) -> Int = "tonyfettes:js/typed_array" "length"

///|
pub fn T::op_set(self : T, offset : Int, value : Float) = "tonyfettes:js/typed_array" "op_set"

///|
pub fn T::op_get(self : T, offset : Int) -> Float = "tonyfettes:js/typed_array" "op_get"

///|
pub fn T::set(self : T, other : T, offset~ : Int = 0) = "tonyfettes:js/typed_array" "set"
