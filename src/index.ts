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
    set: (object: any, key: any, value: any) => {
      object[key] = value;
    },
    get: (object: any, key: any): any => {
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
    strict_equal: (a: string, b: string): boolean => {
      return a === b;
    },
  },
  "tonyfettes:js/array_buffer": {
    new: (length: number): ArrayBuffer => {
      return new ArrayBuffer(length);
    },
  },
  "tonyfettes:js/uint8_array": {
    new: (length: number): Uint8Array => {
      return new Uint8Array(length);
    },
    from_array_buffer: (
      buffer: ArrayBuffer,
      byteOffset: number,
      length: number
    ): Uint8Array => {
      return new Uint8Array(buffer, byteOffset, length);
    },
    from_array: (array: Array<number>): Uint8Array => {
      return Uint8Array.from(array);
    },
    length(array: Uint8Array): number {
      return array.length;
    },
    set(array: Uint8Array, index: number, value: number): void {
      array[index] = value;
    },
    get(array: Uint8Array, index: number): number {
      return array[index];
    },
  },
  "tonyfettes:js/int32_array": {
    new: (length: number): Int32Array => {
      return new Int32Array(length);
    },
    from_array_buffer: (
      buffer: ArrayBuffer,
      byteOffset: number,
      length: number
    ): Int32Array => {
      return new Int32Array(buffer, byteOffset, length);
    },
    from_array: (array: Array<number>): Int32Array => {
      return Int32Array.from(array);
    },
    length(array: Int32Array): number {
      return array.length;
    },
    set(array: Int32Array, index: number, value: number): void {
      array[index] = value;
    },
    get(array: Int32Array, index: number): number {
      return array[index];
    },
  },
  "tonyfettes:js/float32_array": {
    new: (length: number): Float32Array => {
      return new Float32Array(length);
    },
    from_array_buffer: (
      buffer: ArrayBuffer,
      byteOffset: number,
      length: number
    ): Float32Array => {
      return new Float32Array(buffer, byteOffset, length);
    },
    from_array: (array: Array<number>): Float32Array => {
      return Float32Array.from(array);
    },
    length(array: Float32Array): number {
      return array.length;
    },
    set(array: Float32Array, index: number, value: number): void {
      array[index] = value;
    },
    get(array: Float32Array, index: number): number {
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
