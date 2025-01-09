///|
type Console

///|
fn Console::_get() -> Console = "tonyfettes:js/console" "get"

///|
pub let console : Console = Console::_get()

///|
pub(open) trait ConsoleLog {
  log(Console, Self) -> Unit
}

///|
fn Console::_log_object(self : Console, value : Object) -> Unit = "tonyfettes:js/console" "log"

///|
impl ConsoleLog with log(self : Console, value : Self) -> Unit {
  Console::_log_object(self, identity(value))
}

///|
fn Console::_log_int(self : Console, value : Int) -> Unit = "tonyfettes:js/console" "log"

///|
pub impl ConsoleLog for Int with log(self : Console, value : Int) -> Unit {
  Console::_log_int(self, value)
}

///|
fn Console::_log_float(self : Console, value : Float) -> Unit = "tonyfettes:js/console" "log"

///|
pub impl ConsoleLog for Float with log(self : Console, value : Float) -> Unit {
  Console::_log_float(self, value)
}

///|
fn Console::_log_double(self : Console, value : Double) -> Unit = "tonyfettes:js/console" "log"

///|
pub impl ConsoleLog for Double with log(self : Console, value : Double) -> Unit {
  Console::_log_double(self, value)
}

///|
fn Console::_log_bool(self : Console, value : Bool) -> Unit = "tonyfettes:js/console" "log"

///|
pub impl ConsoleLog for Bool with log(self : Console, value : Bool) -> Unit {
  Console::_log_bool(self, value)
}

///|
pub fn Console::log[T : ConsoleLog](self : Console, value : T) -> Unit {
  T::log(self, value)
}
