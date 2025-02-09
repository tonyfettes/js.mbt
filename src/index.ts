declare global {
  type WebAssemblyCompileOptions = {
    builtins: string[];
    importedStringConstants: string;
  };
  namespace WebAssembly {
    function instantiate(
      bytes: BufferSource,
      importObject?: Imports,
      compileOptions?: WebAssemblyCompileOptions,
    ): Promise<WebAssemblyInstantiatedSource>;
    function instantiateStreaming(
      source: Response | PromiseLike<Response>,
      importObject?: WebAssembly.Imports,
      compileOptions?: WebAssemblyCompileOptions,
    ): Promise<WebAssembly.WebAssemblyInstantiatedSource>;
  }
}

export default {
  "tonyfettes:js": {
    isNull: (value: any): boolean => value === null,
    isUndefined: (value: any): boolean => value === undefined,
    identity: <T>(value: T): T => value,
    call: <T, R>(f: (...args: T[]) => R, ...args: T[]): R => f(...args),
  },
  "tonyfettes:js/array": {
    new: () => new Array(0),
    push<T>(array: Array<T>, value: T) {
      array.push(value);
    },
    length<T>(array: Array<T>): number {
      return array.length;
    },
    get<T>(array: Array<T>, index: number): T {
      return array[index];
    },
  },
  "moonbit:ffi": {
    make_closure: (funcref: any, closure: any) => funcref.bind(null, closure),
  },
  console: {
    log: (...args: any[]): void => {
      console.log(...args);
    },
  },
  spectest: {
    print_char: (() => {
      let buffer: number[] = [];
      function flush() {
        if (buffer.length > 0) {
          console.log(
            new TextDecoder("utf-16").decode(new Uint16Array(buffer).valueOf()),
          );
          buffer = [];
        }
      }
      function log(ch: number) {
        if (ch == "\n".charCodeAt(0)) {
          flush();
        } else if (ch == "\r".charCodeAt(0)) {
          /* noop */
        } else {
          buffer.push(ch);
        }
      }
      return log;
    })(),
  },
};
