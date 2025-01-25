import { test, expect } from "vitest";
import JsImports from "../src/index.ts";

async function loadWasm(path: string, imports: WebAssembly.Imports) {
  if (typeof process === "object") {
    const fs = await import("node:fs/promises");
    const { join } = await import("node:path");

    const wasmPath = join(import.meta.dirname, path);
    const wasmBuffer = await fs.readFile(wasmPath);
    return WebAssembly.instantiate(wasmBuffer, imports);
  } else {
    const response = await fetch(path);
    const buffer = await response.arrayBuffer();
    return WebAssembly.instantiate(buffer, imports);
  }
}

export type MoonBitJsTestExports = {
  test_array: () => number[];
};

test("test_array", async () => {
  const { instance } = await loadWasm(
    "target/wasm/release/build/test.wasm",
    JsImports
  );
  const exports = instance.exports as MoonBitJsTestExports;
  expect(exports.test_array()).toMatchInlineSnapshot(`
    [
      3,
    ]
  `);
});
