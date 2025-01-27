/// <reference types="@vitest/browser/providers/playwright" />
import { defineConfig, Plugin } from 'vite';
import { spawn, ChildProcess } from 'node:child_process';

function moonBuild(moduleDir: string = ''): Plugin {
  let process: ChildProcess | null = null;
  let command: "build" | "serve"

  return {
    name: 'moon-build',
    configResolved(resolvedConfig) {
      command = resolvedConfig.command
    },
    buildStart() {
      const args = ['build', '--target', 'all', '--debug'];
      // if (command === 'serve') {
      //   args.push('--watch');
      // }
      if (moduleDir) {
        args.push('--directory', moduleDir);
      }
      process = spawn('moon', args, { stdio: ['inherit', 'ignore', 'inherit'] });
    },
    buildEnd() {
      if (process && !process.killed) {
        process.kill();
        process = null;
      }
    }
  };
}

export default defineConfig({
  plugins: [moonBuild('.'), moonBuild('test')],
  test: {
    browser: {
      enabled: true,
      provider: 'playwright',
      instances: [
        {
          browser: 'firefox',
          headless: true
        }
      ]
    }
  }
});
