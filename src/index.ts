declare global {
  type WebAssemblyCompileOptions = {
    builtins: string[];
    importedStringConstants: string;
  };
  namespace WebAssembly {
    function instantiate(
      bytes: BufferSource,
      importObject?: Imports,
      compileOptions?: WebAssemblyCompileOptions
    ): Promise<WebAssemblyInstantiatedSource>;
    function instantiateStreaming(
      source: Response | PromiseLike<Response>,
      importObject?: WebAssembly.Imports,
      compileOptions?: WebAssemblyCompileOptions
    ): Promise<WebAssembly.WebAssemblyInstantiatedSource>;
  }
}

export default {
  "tonyfettes:js": {
    null: () => null,
    is_null: (value: any): boolean => value === null,
    is_undefined: (value: any): boolean => value === undefined,
    is_boolean: (value: any): boolean => typeof value === "boolean",
    is_number: (value: any): boolean => typeof value === "number",
    is_object: (value: any): boolean => typeof value === "object",
    is_string: (value: any): boolean => typeof value === "string",
    identity: <T>(value: T): T => value,
    call: <T, R>(f: (...args: T[]) => R, ...args: T[]): R => f(...args),
  },
  "tonyfettes:js/array": {
    is_array: (object: Object): boolean => {
      return Array.isArray(object);
    },
    new: <T>(): Array<T> => new Array(0),
    push<T>(array: Array<T>, value: T) {
      array.push(value);
    },
    length<T>(array: Array<T>): number {
      return array.length;
    },
    set<T>(array: Array<T>, index: number, value: T): void {
      array[index] = value;
    },
    get<T>(array: Array<T>, index: number): T {
      return array[index];
    },
  },
  "tonyfettes:js/object": {
    new: () => ({}),
    set: (object: any, key: string, value: any) => {
      object[key] = value;
    },
    get: (object: any, key: string): any => {
      return object[key];
    },
  },
  "tonyfettes:js/string": {
    make: (chars: number[]): string => {
      return String.fromCharCode(...chars);
    },
    length: (string: string): number => {
      return string.length;
    },
    char_code_at: (string: string, index: number): number => {
      return string.charCodeAt(index);
    },
    equal: (a: string, b: string): boolean => {
      return a === b;
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
            new TextDecoder("utf-16").decode(new Uint16Array(buffer).valueOf())
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
