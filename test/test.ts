import JsImports from "../src/index.ts";
import Assert from "node:assert/strict";
import * as Moon from "./moon.ts";

type MoonBitTestExports = {
  test_array_int: () => number[];
  test_array_float: () => number[];
  test_array_double: () => number[];
  test_array_modify: (array: number[]) => undefined;
  test_int: (value: number | undefined) => number;
  test_int_option: (value: number | undefined) => number;
  test_is_null: (value: null) => boolean;
};

Moon.test<MoonBitTestExports>(undefined, JsImports, async (exports) => {
  Assert.deepStrictEqual(exports.test_array_int(), [3]);
  Assert.deepStrictEqual(exports.test_array_float(), [1, 2, 3]);
  Assert.deepStrictEqual(exports.test_array_double(), [1, 2, 3]);
  const array = [1, 2, 3];
  exports.test_array_modify(array);
  Assert.deepStrictEqual(array, [1, 2, 3, 4]);
  Assert.strictEqual(exports.test_int(42), 42);
  Assert.strictEqual(exports.test_int(undefined), -1);
  Assert.strictEqual(!!exports.test_is_null(null), true);
});
