import Assert from "node:assert/strict";
import JsImports from "../../src/index.ts";
import * as Moon from "../moon.ts";

type Exports = {
  uint8_array_length: (array: Uint8Array) => number;
  uint8_array_set: (array: Uint8Array, index: number, value: number) => void;
  uint8_array_get: (array: Uint8Array, index: number) => number;
};

Moon.test<Exports>("uint8_array", JsImports, async (exports) => {
  // Randomly generate a Uint8Array of length 10
  const array = new Uint8Array(Math.floor(Math.random() * 10));
  for (let i = 0; i < array.length; i++) {
    array[i] = Math.floor(Math.random() * 256);
  }
  // Check the length of the array
  Assert.strictEqual(exports.uint8_array_length(array), array.length);
  // Check the values of the array
  for (let i = 0; i < array.length; i++) {
    Assert.strictEqual(exports.uint8_array_get(array, i), array[i]);
  }
  // Modify the array
  const index = Math.floor(Math.random() * array.length);
  const value = Math.floor(Math.random() * 256);
  exports.uint8_array_set(array, index, value);
  // Check the modified value
  console.log("index", index);
  console.log("value", value);
  console.log("array", array);
  Assert.strictEqual(exports.uint8_array_get(array, index), value);
  // Check the other values are unchanged
  for (let i = 0; i < array.length; i++) {
    if (i !== index) {
      Assert.strictEqual(exports.uint8_array_get(array, i), array[i]);
    }
  }
  // Check creation from ArrayBuffer
  const buffer = new ArrayBuffer(8);
  const uint8Array = new Uint8Array(buffer);
  Assert.strictEqual(exports.uint8_array_length(uint8Array), 8);
  for (let i = 0; i < uint8Array.length; i++) {
    Assert.strictEqual(exports.uint8_array_get(uint8Array, i), 0);
  }
  // Check creation from TypedArray
  const typedArray = new Uint8Array(8);
  for (let i = 0; i < typedArray.length; i++) {
    typedArray[i] = Math.floor(Math.random() * 256);
  }
  Assert.strictEqual(exports.uint8_array_length(typedArray), 8);
  for (let i = 0; i < typedArray.length; i++) {
    Assert.strictEqual(exports.uint8_array_get(typedArray, i), typedArray[i]);
  }
  // Check creation from Array
  const array2 = new Uint8Array([1, 2, 3, 4, 5]);
  Assert.strictEqual(exports.uint8_array_length(array2), 5);
  for (let i = 0; i < array2.length; i++) {
    Assert.strictEqual(exports.uint8_array_get(array2, i), array2[i]);
  }
  // Check creation from empty array
  const emptyArray = new Uint8Array([]);
  Assert.strictEqual(exports.uint8_array_length(emptyArray), 0);
  for (let i = 0; i < emptyArray.length; i++) {
    Assert.strictEqual(exports.uint8_array_get(emptyArray, i), 0);
  }
  // Check creation from empty buffer
  const emptyBuffer = new ArrayBuffer(0);
  const emptyUint8Array = new Uint8Array(emptyBuffer);
  Assert.strictEqual(exports.uint8_array_length(emptyUint8Array), 0);
  for (let i = 0; i < emptyUint8Array.length; i++) {
    Assert.strictEqual(exports.uint8_array_get(emptyUint8Array, i), 0);
  }
  // Check creation from empty typed array
  const emptyTypedArray = new Uint8Array(0);
  Assert.strictEqual(exports.uint8_array_length(emptyTypedArray), 0);
  for (let i = 0; i < emptyTypedArray.length; i++) {
    Assert.strictEqual(exports.uint8_array_get(emptyTypedArray, i), 0);
  }
});
