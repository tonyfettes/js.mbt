import * as Test from "node:test";
import Fsp from "node:fs/promises";
import Path from "node:path";
import ChildProcess from "node:child_process";

function build(
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
    cwd: import.meta.dirname,
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

export async function load<T>({
  target,
  profile,
  imports,
  package: packagePath,
}: {
  target: "js" | "wasm" | "wasm-gc";
  profile: "debug" | "release";
  imports: WebAssembly.Imports;
  package?: string;
}): Promise<T> {
  build(target, profile);
  const extension = getExtension(target);
  const packageName = packagePath ? Path.basename(packagePath) : "test";
  let artifactPathComponents = [];
  artifactPathComponents.push(
    import.meta.dirname,
    "target",
    target,
    profile,
    "build"
  );
  if (packagePath) {
    artifactPathComponents.push(packagePath);
  }
  artifactPathComponents.push(`${packageName}.${extension}`);
  const artifactPath = Path.join(...artifactPathComponents);
  if (target === "js") {
    return (await import(artifactPath)) as T;
  } else {
    const wasmBuffer = await Fsp.readFile(artifactPath);
    const { instance } = await WebAssembly.instantiate(wasmBuffer, imports);
    return instance.exports as T;
  }
}

export async function test<T>(
  packageName: string | undefined,
  imports: WebAssembly.Imports,
  fn: (exports: T) => void | Promise<void>
): Promise<(context: Test.TestContext) => Promise<void>> {
  return async (context: Test.TestContext) => {
    await context.test(packageName, async () => {
      const targets = ["js", "wasm", "wasm-gc"] as const;
      const profiles = ["debug", "release"] as const;
      const targetExports = [];
      for (const target of targets) {
        for (const profile of profiles) {
          targetExports.push(
            await load<T>({ target, profile, package: packageName, imports })
          );
        }
      }
      for (const exports of targetExports) {
        await fn(exports);
      }
    });
  };
}
