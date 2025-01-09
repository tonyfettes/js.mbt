///|
type Console

///|
extern "js" fn Console::_get() -> Console =
  #|() => console

///|
pub let console : Console = Console::_get()

///|
extern "js" fn Console::_log(self : Console, value : Value) -> Unit =
  #|(console, value) => console.log(value)

///|
pub fn Console::log[T : ToValue](self : Console, value : T) -> Unit {
  self._log(value.to_value())
}
