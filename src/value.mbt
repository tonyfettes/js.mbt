///|
pub extern type Value

///|
pub(open) trait ToValue {
  to_js_value(Self) -> Value
}

///|
pub(open) trait OfValue {
  of_value(Value) -> Self!
}

///|
pub fn Value::of[T : ToValue](value : T) -> Value {
  value.to_js_value()
}

///|
pub impl OfValue for Value with of_value(self : Value) -> Value! {
  self
}

///|
pub fn Value::to_bool(self : Value) -> Bool! {
  if self.is_boolean() {
    self.as_bool()
  } else {
    raise TypeError::new("Expected a boolean value")
  }
}

///|
pub fn Value::to_int(self : Value) -> Int! {
  if self.is_number() {
    self.as_int()
  } else {
    raise TypeError::new("Expected an integer value")
  }
}

///|
pub fn Value::to_uint(self : Value) -> UInt! {
  if self.is_number() {
    self.as_uint()
  } else {
    raise TypeError::new("Expected an unsigned integer value")
  }
}

///|
pub fn Value::to_int64(self : Value) -> Int64! {
  if self.is_number() {
    self.as_int64()
  } else {
    raise TypeError::new("Expected a 64-bit integer value")
  }
}

///|
pub fn Value::to_uint64(self : Value) -> UInt64! {
  if self.is_number() {
    self.as_uint64()
  } else {
    raise TypeError::new("Expected a 64-bit unsigned integer value")
  }
}

///|
pub fn Value::to_char(self : Value) -> Char! {
  if self.is_number() {
    self.as_char()
  } else {
    raise TypeError::new("Expected a character value")
  }
}

///|
pub fn Value::to_float(self : Value) -> Float! {
  if self.is_number() {
    self.as_float()
  } else {
    raise TypeError::new("Expected a float value")
  }
}

///|
pub fn Value::to_double(self : Value) -> Double! {
  if self.is_number() {
    self.as_double()
  } else {
    raise TypeError::new("Expected a double value")
  }
}

///|
pub impl ToValue for Value with to_js_value(self : Value) -> Value {
  self
}

///|
pub impl ToValue for Bool with to_js_value(self : Bool) -> Value {
  Value::of_bool(self)
}

///|
pub impl ToValue for Int16 with to_js_value(self : Int16) -> Value {
  Value::of_int16(self)
}

///|
pub impl ToValue for UInt16 with to_js_value(self : UInt16) -> Value {
  Value::of_uint16(self)
}

///|
pub impl ToValue for Int with to_js_value(self : Int) -> Value {
  Value::of_int(self)
}

///|
pub impl ToValue for UInt with to_js_value(self : UInt) -> Value {
  Value::of_uint(self)
}

///|
pub impl ToValue for Int64 with to_js_value(self : Int64) -> Value {
  Value::of_int64(self)
}

///|
pub impl ToValue for UInt64 with to_js_value(self : UInt64) -> Value {
  Value::of_uint64(self)
}

///|
pub impl ToValue for Char with to_js_value(self : Char) -> Value {
  Value::of_char(self)
}

///|
pub impl ToValue for Float with to_js_value(self : Float) -> Value {
  Value::of_float(self)
}

///|
pub impl ToValue for Double with to_js_value(self : Double) -> Value {
  Value::of_double(self)
}

///|
pub fn Value::to_js_object(self : Value) -> Object! {
  OfValue::of_value!(self)
}

///|
pub fn Value::to_js_error(self : Value) -> Err! {
  OfValue::of_value!(self)
}

///|
pub fn Value::to_js_array(self : Value) -> Array! {
  OfValue::of_value!(self)
}

///|
pub fn Value::to_float32_array(self : Value) -> Float32Array! {
  OfValue::of_value!(self)
}

///|
pub fn Value::to_js_string(self : Value) -> Str! {
  OfValue::of_value!(self)
}
