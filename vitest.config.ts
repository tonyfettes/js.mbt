/// <reference types="@vitest/browser/providers/playwright" />
import { defineConfig } from 'vite';
import { spawnSync } from 'node:child_process';

function moonPlugin(moduleDir: string = '') {
  return {
    name: 'moon-build',
    buildStart() {
      console.log('Running moon build...');
      const args = ['build', '--target', 'wasm', '--debug'];
      if (moduleDir) {
        args.push('--directory', moduleDir);
      }
      const result = spawnSync('moon', args, { stdio: 'inherit' });
      if (result.error) {
        throw result.error;
      }
    }
  };
}

export default defineConfig({
  plugins: [moonPlugin('test')],
  // test: {
  //   browser: {
  //     enabled: true,
  //     provider: 'playwright',
  //     instances: [
  //       {
  //         browser: 'firefox',
  //       }
  //     ]
  //   }
  // }
});
