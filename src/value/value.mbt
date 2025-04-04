///|
pub extern type T

///|
pub(open) trait Of {
  to_value(Self) -> T
}

///|
pub(open) trait To {
  to(T) -> Self?
}

///|
pub fn to[To : To](self : T) -> To? {
  To::to(self)
}

///|
pub impl To for Bool with to(self : T) -> Bool? {
  if self.is_boolean() {
    Some(self.to_bool())
  } else {
    None
  }
}

///|
pub impl To for Int with to(self : T) -> Int? {
  if self.is_number() {
    Some(self.to_int())
  } else {
    None
  }
}

///|
pub impl To for Float with to(self : T) -> Float? {
  if self.is_number() {
    Some(self.to_float())
  } else {
    None
  }
}

///|
pub impl To for Double with to(self : T) -> Double? {
  if self.is_number() {
    Some(self.to_double())
  } else {
    None
  }
}

///|
pub impl Of for Bool with to_value(self : Bool) -> T {
  T::of_bool(self)
}

///|
pub impl Of for Int with to_value(self : Int) -> T {
  T::of_int(self)
}

///|
pub impl Of for Float with to_value(self : Float) -> T {
  T::of_float(self)
}

///|
pub impl Of for Double with to_value(self : Double) -> T {
  T::of_double(self)
}
