import Assert from "node:assert/strict";
import JsImports from "../../src/index.ts";
import * as Moon from "../moon.ts";

type Exports = {
  int32_array_length: (array: Int32Array) => number;
  int32_array_set: (array: Int32Array, index: number, value: number) => void;
  int32_array_get: (array: Int32Array, index: number) => number;
};

export default Moon.test<Exports>("int32_array", JsImports, async (exports) => {
  // Randomly generate a Int32Array of random length between 8 and 16
  const length = Math.floor(Math.random() * 9) + 8;
  const array = new Int32Array(length);
  for (let i = 0; i < length; i++) {
    array[i] = Math.floor(Math.random() * 256);
  }
  // Check the length of the array
  Assert.strictEqual(exports.int32_array_length(array), length);
  // Check the values of the array
  for (let i = 0; i < length; i++) {
    Assert.strictEqual(exports.int32_array_get(array, i), array[i]);
  }
  // Modify the array
  const index = Math.floor(Math.random() * length);
  const value = Math.floor(Math.random() * 256);
  exports.int32_array_set(array, index, value);
  // Check the modified value
  Assert.strictEqual(exports.int32_array_get(array, index), value);
  // Check the other values are unchanged
  for (let i = 0; i < length; i++) {
    if (i !== index) {
      Assert.strictEqual(exports.int32_array_get(array, i), array[i]);
    }
  }
});
