import Assert from "node:assert/strict";
import JsImports from "../../src/index.ts";
import * as Moon from "../moon.ts";

type Exports = {
  float32_array_length: (array: Float32Array) => number;
  float32_array_set: (
    array: Float32Array,
    index: number,
    value: number
  ) => void;
  float32_array_get: (array: Float32Array, index: number) => number;
};

Moon.test<Exports>("float32_array", JsImports, async (exports) => {
  const array = new Float32Array([1.1, 2.2, 3.3, 4.4, 5.5]);
  Assert.strictEqual(exports.float32_array_length(array), 5);
  Assert.strictEqual(exports.float32_array_get(array, 0), array[0]);
  exports.float32_array_set(array, 0, 6.6);
  Assert.strictEqual(exports.float32_array_get(array, 0), array[0]);
});
