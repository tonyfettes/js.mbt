/// <reference types="@vitest/browser/providers/playwright" />
import { defineConfig, Plugin } from "vite";
import { spawn, ChildProcess } from "node:child_process";

const targets = ["js", "wasm", "wasm-gc"] as const;

function moonBuild(moduleDir: string = ""): Plugin {
  let process: {
    wasm?: ChildProcess;
    "wasm-gc"?: ChildProcess;
    js?: ChildProcess;
  } = {};
  let command: "build" | "serve";

  return {
    name: "moon-build",
    configResolved(resolvedConfig) {
      command = resolvedConfig.command;
    },
    buildStart() {
      for (const target of ["wasm-gc", "js"] as const) {
        const args = ["build", "--target", target, "--debug"];
        if (moduleDir) {
          args.push("--directory", moduleDir);
        }
        process[target] = spawn("moon", args, {
          stdio: ["inherit", "ignore", "inherit"],
        });
      }
    },
    buildEnd() {
      for (const target of ["wasm-gc", "js"] as const) {
        const proc = process[target]
        if (proc && !proc.killed) {
          proc.kill();
          proc[target] = undefined;
        }
      }
    },
  };
}

export default defineConfig({
  plugins: [moonBuild("."), moonBuild("test")],
  test: {
    browser: {
      enabled: true,
      provider: "playwright",
      instances: [
        {
          browser: "firefox",
          headless: true,
        },
      ],
    },
  },
});
