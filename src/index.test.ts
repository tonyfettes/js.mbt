import JsImports from "./index.ts";
import wasmUrl from "../target/wasm-gc/debug/test/js.blackbox_test.wasm?url";
import { expect, test } from "vitest";
import fs from "fs/promises";
import path from "path";

declare global {
  namespace WebAssembly {
    type MoonTestWasmExports = {
      moonbit_test_driver_internal_execute: (
        filename: string,
        index: number
      ) => void;
    };
    class MoonTestInstance extends Instance {
      readonly exports: MoonTestWasmExports;
    }
    interface MoonTestInstantiatedSource extends WebAssemblyInstantiatedSource {
      instance: MoonTestInstance;
    }
    interface TagType {
      parameters: WebAssembly.ValueType[];
    }
    class Tag {
      constructor(tagType: TagType);
    }
    interface ExceptionOptions {
      traceStack: boolean;
    }
    class Exception {
      constructor(tag: Tag, args: any[], options?: ExceptionOptions);
      getArg(index: number): any;
      is(tag: Tag): boolean;
      readonly stack: DOMStringList;
    }
    function instantiate(
      bytes: BufferSource,
      importObject?: Imports,
      compileOptions?: WebAssemblyCompileOptions
    ): Promise<MoonTestInstantiatedSource>;
    function instantiateStreaming(
      source: Response | PromiseLike<Response>,
      importObject?: Imports,
      compileOptions?: WebAssemblyCompileOptions
    ): Promise<MoonTestInstantiatedSource>;
  }
}

let trace: string[] = [];

type MoonTestResult = {
  package: string;
  filename: string;
  index: number;
  test_name: string;
  message: string;
};

const log = (() => {
  let buffer: number[] = [];
  function flush() {
    if (buffer.length > 0) {
      const string = new TextDecoder("utf-16").decode(
        new Uint16Array(buffer).valueOf()
      );
      // console.log(string);
      trace.push(string);
      buffer = [];
    }
  }
  function log(ch: number) {
    if (ch === "\n".charCodeAt(0)) {
      flush();
    } else if (ch === "\r".charCodeAt(0)) {
      /* noop */
    } else {
      buffer.push(ch);
    }
  }
  return log;
})();

const tag = new WebAssembly.Tag({ parameters: [] });
const spectest: WebAssembly.Imports = {
  spectest: {
    print_char: log,
  },
  __moonbit_fs_unstable: {
    begin_read_string(s: string) {
      return { s: s, i: 0 };
    },
    string_read_char(handle: { s: string; i: number }) {
      if (handle.i >= handle.s.length) {
        return -1;
      }
      return handle.s.charCodeAt(handle.i++);
    },
    finish_read_string(_handle: { s: string; i: number }) {
      return;
    },
  },
  moonbit: {
    string_to_js_string() {
      console.log(arguments[0]);
    },
  },
  exception: {
    tag: tag as WebAssembly.ImportValue,
    throw: () => {
      throw new WebAssembly.Exception(tag, [], { traceStack: true });
    },
  },
  console: {
    log: (x: any) => console.log(x),
  },
};

async function testPackage(
  instance: WebAssembly.MoonTestInstance,
  packageName: string,
  testParams: { file: string; index: number }[]
) {
  for (const param of testParams) {
    try {
      instance.exports.moonbit_test_driver_internal_execute(
        param.file,
        param.index
      );
    } catch (e) {
      if (e instanceof WebAssembly.Exception) {
        console.log("----- BEGIN MOON TEST RESULT -----");
        console.log(
          `{"package": "${packageName}", "filename": "${
            param.file
          }", "index": "${param.index}", "test_name": "${
            param.index
          }", "message": "${e.stack
            .toString()
            .replaceAll("\\", "\\\\")
            .split("\n")
            .join("\\n")}"}`
        );
        console.log("----- END MOON TEST RESULT -----");
      }
    }
  }
}

const importObject: WebAssembly.Imports = {
  ...spectest,
  ...JsImports,
};
const wasmPath = path.join(__dirname, "..", wasmUrl);
const bytes = await fs.readFile(wasmPath);
const { instance } = await WebAssembly.instantiate(bytes, importObject, {
  builtins: ["js-string"],
  importedStringConstants: "_",
});

test("array_test.mbt", async () => {
  trace = [];
  testPackage(instance, "js", [
    { file: "array_test.mbt", index: 0 },
    { file: "array_test.mbt", index: 1 },
    { file: "array_test.mbt", index: 2 }
  ]);
  let failed = []
  for (const line of trace) {
    try {
      const result = JSON.parse(line) as MoonTestResult;
      if (result.message) {
        failed.push(result);
      }
    } catch (e) {
      continue;
    }
  };
  expect(failed).toMatchObject([]);
});
