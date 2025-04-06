import Assert from "node:assert/strict";
import JsImports from "../../src/index.ts";
import * as Moon from "../moon.ts";

type Exports = {
  uint8_array_length: (array: Uint8Array) => number;
  uint8_array_set: (array: Uint8Array, index: number, value: number) => void;
  uint8_array_get: (array: Uint8Array, index: number) => number;
};

export default Moon.test<Exports>("uint8_array", JsImports, async (exports) => {
  const array = new Uint8Array([1, 2, 3, 4, 5]);
  Assert.strictEqual(exports.uint8_array_length(array), 5);
  Assert.strictEqual(exports.uint8_array_get(array, 0), array[0]);
  exports.uint8_array_set(array, 0, 6);
  for (let i = 1; i < array.length; i++) {
    Assert.strictEqual(exports.uint8_array_get(array, i), array[i]);
  }
});
