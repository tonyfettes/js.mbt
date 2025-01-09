declare global {
  type WebAssemblyCompileOptions = {
    builtins: string[];
    importedStringConstants: string;
  };
  namespace WebAssembly {
    function instantiateStreaming(
      source: Response | PromiseLike<Response>,
      importObject?: WebAssembly.Imports,
      compileOptions?: WebAssemblyCompileOptions
    ): Promise<WebAssembly.WebAssemblyInstantiatedSource>;
  }
}

export default {
  "tonyfettes:js/array": {
    new: () => new Array(0),
    push<T>(array: Array<T>, value: T) {
      array.push(value);
    },
    length<T>(array: Array<T>): number {
      return array.length;
    },
  },
  "tonyfettes:js/console": {
    get: () => console,
    log: (console: Console, object: any) => {
      console.log(object);
    },
  },
  "moonbit:ffi": {
    make_closure: (funcref: any, closure: any) => funcref.bind(null, closure),
  },
};
