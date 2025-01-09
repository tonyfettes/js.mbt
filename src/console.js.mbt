///|
type Console

///|
extern "js" fn Console::_get() -> Console =
  #|() => console

///|
pub let console : Console = Console::_get()

///|
extern "js" fn Console::_log(self : Console, value : Object) -> Unit =
  #|(console, object) => console.log(object)

///|
pub fn Console::log[T](self : Console, value : T) -> Unit {
  self._log(identity(value))
}
