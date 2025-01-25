import { defineConfig } from 'vite';
import { spawnSync } from 'node:child_process';

function moonPlugin(moduleDir: string = '') {
  return {
    name: 'moon-build',
    buildStart() {
      console.log('Running moon build...');
      const args = moduleDir ? ['build', '--directory', moduleDir] : ['build'];
      const result = spawnSync('moon', args, { stdio: 'inherit' });
      if (result.error) {
        throw result.error;
      }
    }
  };
}

export default defineConfig({
  plugins: [moonPlugin(), moonPlugin('test')]
});

