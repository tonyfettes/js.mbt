///|
type Value

///|
pub(open) trait ToValue {
  to_value(Self) -> Value
}

///|
impl ToValue with to_value(self : Self) -> Value { identity(self) }

///|
pub impl[T : ToValue] ToValue for FixedArray[T] with to_value(
  self : FixedArray[T]
) -> Value {
  identity(self)
}

///|
fn identity[T, U](value : T) -> U = "%identity"
