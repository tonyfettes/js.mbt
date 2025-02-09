import { test, expect } from "vitest";
import JsImports from "../src/index.ts";
import wasmUrl from "./target/wasm/debug/build/test.wasm?url";
import * as JsExports from "./target/js/debug/build/test";

async function loadWasm(imports: WebAssembly.Imports) {
  if (typeof process === "object") {
    const fs = await import("node:fs/promises");
    const { join } = await import("node:path");

    const wasmPath = join(import.meta.dirname, "..", wasmUrl);
    const wasmBuffer = await fs.readFile(wasmPath);
    return WebAssembly.instantiate(wasmBuffer, imports);
  } else {
    const wasmUrl = new URL(
      "target/wasm/debug/build/test.wasm",
      import.meta.url,
    );
    return WebAssembly.instantiateStreaming(fetch(wasmUrl), imports);
  }
}

export type MoonBitJsTestExports = {
  test_array_int: () => number[];
  test_array_float: () => number[];
  test_array_double: () => number[];
  test_array_modify: (array: number[]) => undefined;
  test_int: (value: number) => number;
  test_int_option: (value: number | undefined) => number;
  test_is_null: (value: null) => boolean;
};

test("test", async () => {
  const { instance } = await loadWasm(JsImports);
  const wasmExports = instance.exports as MoonBitJsTestExports;
  for (const exports of [wasmExports, JsExports]) {
    expect(exports.test_array_int()).toMatchObject([3]);
    expect(exports.test_array_float()).toMatchObject([1, 2, 3]);
    expect(exports.test_array_double()).toMatchObject([1, 2, 3]);
    const array = [1, 2, 3];
    exports.test_array_modify(array);
    expect(array).toMatchObject([1, 2, 3, 4]);
    expect(exports.test_int(42)).toBe(42);
    expect(exports.test_int_option(42)).toBe(42);
    expect(exports.test_int_option(undefined)).toBe(-1);
    expect(exports.test_is_null(null)).toBe(true);
  }
});
