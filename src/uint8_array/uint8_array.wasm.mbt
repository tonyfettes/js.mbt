///|
pub extern type T

///|
pub fn new(length : Int) -> T = "tonyfettes:js/uint8_array" "new"

///|
pub fn T::new(length : Int) -> T = "tonyfettes:js/uint8_array" "new"

///|
pub fn from_array_buffer(array : @array_buffer.T) -> T = "tonyfettes:js/uint8_array" "from_array_buffer"

///|
pub fn T::from_array_buffer(array : @array_buffer.T) -> T = "tonyfettes:js/uint8_array" "from_array_buffer"

///|
pub fn from_array(array : @array.T) -> T = "tonyfettes:js/uint8_array" "from_array"

///|
pub fn T::from_array(array : @array.T) -> T = "tonyfettes:js/uint8_array" "from_array"

///|
pub fn length(self : T) -> Int = "tonyfettes:js/uint8_array" "length"

///|
pub fn T::op_set(self : T, offset : Int, value : Byte) = "tonyfettes:js/uint8_array" "set"

///|
pub fn T::op_get(self : T, offset : Int) -> Byte = "tonyfettes:js/uint8_array" "get"
