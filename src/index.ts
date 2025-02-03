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

const importObject: WebAssembly.Imports = {
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
};

export default importObject;
