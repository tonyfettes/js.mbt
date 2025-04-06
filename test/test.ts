import * as Test from "node:test";
import JsImports from "../src/index.ts";
import Assert from "node:assert/strict";
import * as Moon from "./moon.ts";
import ArrayTest from "./array/test.ts";
import Uint8ArrayTest from "./uint8_array/test.ts";
import Int32ArrayTest from "./int32_array/test.ts";
import Float32ArrayTest from "./float32_array/test.ts";

type MoonBitTestExports = {
  test_int: (value: number | undefined) => number;
  test_int_option: (value: number | undefined) => number;
  test_is_null: (value: null) => boolean;
};

Test.test("test", async (context) => {
  const tests = [
    await Moon.test<MoonBitTestExports>(
      undefined,
      JsImports,
      async (exports) => {
        Assert.strictEqual(exports.test_int(42), 42);
        Assert.strictEqual(exports.test_int(undefined), -1);
        Assert.strictEqual(!!exports.test_is_null(null), true);
      }
    ),
    await Uint8ArrayTest,
    await Int32ArrayTest,
    await Float32ArrayTest,
    await ArrayTest,
  ];
  for (const test of tests) {
    await test(context);
  }
});
