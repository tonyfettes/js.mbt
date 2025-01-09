///|
type Console

///|
fn Console::_get() -> Console = "tonyfettes:js/console" "get"

///|
pub let console : Console = Console::_get()

///|
fn Console::_log_object(self : Console, value : Object) -> Unit = "tonyfettes:js/console" "log"

///|
fn Console::_log_int(self : Console, value : Int) -> Unit = "tonyfettes:js/console" "log"

///|
fn Console::_log_float(self : Console, value : Float) -> Unit = "tonyfettes:js/console" "log"

///|
fn Console::_log_double(self : Console, value : Double) -> Unit = "tonyfettes:js/console" "log"

///|
fn Console::_log_bool(self : Console, value : Bool) -> Unit = "tonyfettes:js/console" "log"

///|
pub fn Console::log[T : ToValue](self : Console, value : T) -> Unit {
  match value.to_value() {
    Bool(value) => Console::_log_bool(identity(self), value)
    Int(value) => Console::_log_int(identity(self), value)
    Double(value) => Console::_log_double(identity(self), value)
    Object(value) => Console::_log_object(identity(self), value)
  }
}
