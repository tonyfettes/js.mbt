///|
pub fn run_async(f :  async() -> Unit) -> Unit = "%async.run"

///|
pub async fn suspend[T](f : ((T) -> Unit) -> Unit) -> T = "%async.suspend"
