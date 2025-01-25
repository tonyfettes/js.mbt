import { test, expect } from "vitest";
import JsImports from "../src/index.ts";

async function loadWasm(imports: WebAssembly.Imports) {
  if (typeof process === "object") {
    const fs = await import("node:fs/promises");
    const { join } = await import("node:path");

    const wasmPath = join(
      import.meta.dirname,
      "target/wasm/debug/build/test.wasm"
    );
    const wasmBuffer = await fs.readFile(wasmPath);
    return WebAssembly.instantiate(wasmBuffer, imports);
  } else {
    const wasmUrl = new URL(
      "target/wasm/debug/build/test.wasm",
      import.meta.url
    );
    return WebAssembly.instantiateStreaming(fetch(wasmUrl), imports);
  }
}

export type MoonBitJsTestExports = {
  test_array: () => number[];
  test_int: () => number;
};

test("test_array", async () => {
  const { instance } = await loadWasm(JsImports);
  const exports = instance.exports as MoonBitJsTestExports;
  expect(exports.test_array()).toMatchInlineSnapshot(`
    [
      3,
    ]
  `);
  expect(exports.test_int(42)).toMatchInlineSnapshot(`42`);
});
