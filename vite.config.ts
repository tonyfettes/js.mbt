import dts from "vite-plugin-dts";
import { defineConfig } from "vite";
import { resolve } from "node:path";

export default defineConfig({
  build: {
    lib: {
      entry: resolve(__dirname, "src/index.ts"),
      name: "js.mbt",
      formats: ["es"],
      fileName: "index",
    },
  },
  plugins: [dts({ rollupTypes: true, tsconfigPath: 'tsconfig.src.json' })],
});
