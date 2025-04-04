import test from "node:test";
import JsImports from "../src/index.ts";
import fs from "node:fs/promises";
import Path from "node:path";
import assert from "node:assert/strict";
import ChildProcess from "node:child_process";

type MoonBitTestExports = {
  test_array_int: () => number[];
  test_array_float: () => number[];
  test_array_double: () => number[];
  test_array_modify: (array: number[]) => undefined;
  test_int: (value: number) => number;
  test_int_option: (value: number | undefined) => number;
  test_is_null: (value: null) => boolean;
};

function moonBuild(
  target: "js" | "wasm" | "wasm-gc",
  profile: "debug" | "release"
) {
  const args = ["build", "--target", target];
  if (profile === "release") {
    args.push("--release");
  } else {
    args.push("--debug");
  }
  const process = ChildProcess.spawnSync("moon", args, {
    stdio: "inherit",
  });
  if (process.status !== 0) {
    throw process.error;
  }
}

function getExtension(target: "js" | "wasm" | "wasm-gc") {
  switch (target) {
    case "js":
      return "js";
    case "wasm":
    case "wasm-gc":
      return "wasm";
  }
}

async function loadExports(
  target: "js" | "wasm" | "wasm-gc",
  profile: "debug" | "release",
  imports: WebAssembly.Imports
): Promise<MoonBitTestExports> {
  moonBuild(target, profile);
  const extension = getExtension(target);
  const artifactPath = Path.join(
    import.meta.dirname,
    `target/${target}/${profile}/build/test.${extension}`
  );
  if (target === "js") {
    return (await import(artifactPath)) as MoonBitTestExports;
  } else {
    const wasmBuffer = await fs.readFile(artifactPath);
    const { instance } = await WebAssembly.instantiate(wasmBuffer, imports);
    return instance.exports as MoonBitTestExports;
  }
}

test("test", async () => {
  const targets = ["js", "wasm", "wasm-gc"] as const;
  const profiles = ["debug", "release"] as const;
  const targetExports = [];
  for (const target of targets) {
    for (const profile of profiles) {
      targetExports.push(await loadExports(target, profile, JsImports));
    }
  }
  for (const exports of targetExports) {
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
