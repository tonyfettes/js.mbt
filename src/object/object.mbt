///|
pub extern type T

///|
pub impl @value.To for T with to(value : @value.T) -> T? {
  guard _is(value) else { return None }
  Some(_to(value))
}

///|
pub impl @value.Of for T with to_value(self : T) -> @value.T = "%identity"

///|
pub(open) trait Of {
  to_object(Self) -> T
}

///|
pub(open) trait To {
  to(T) -> Self?
}

///|
pub fn to[To : To](self : T) -> To? {
  To::to(self)
}
