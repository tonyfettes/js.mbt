import test from "node:test";
import JsImports from "../src/index.ts";
import fs from "node:fs/promises";
import path from "node:path";
import assert from "node:assert/strict";
import * as JsExports from "./target/js/debug/build/test.js";

async function loadWasm(imports: WebAssembly.Imports) {
  const wasmPath = path.join(
    import.meta.dirname,
    "target/wasm/debug/build/test.wasm"
  );
  const wasmBuffer = await fs.readFile(wasmPath);
  return WebAssembly.instantiate(wasmBuffer, imports);
}

type MoonBitJsTestExports = {
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
    assert.deepStrictEqual(exports.test_array_int(), [3]);
    assert.deepStrictEqual(exports.test_array_float(), [1, 2, 3]);
    assert.deepStrictEqual(exports.test_array_double(), [1, 2, 3]);
    const array = [1, 2, 3];
    exports.test_array_modify(array);
    assert.deepStrictEqual(array, [1, 2, 3, 4]);
    assert.strictEqual(exports.test_int(42), 42);
    assert.strictEqual(exports.test_int(undefined), -1);
    assert.strictEqual(!!exports.test_is_null(null), true);
  }
});
