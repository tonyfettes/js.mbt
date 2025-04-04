import Fs from "node:fs";
import Path from "node:path";

if (Fs.existsSync("publish")) {
  Fs.rmdirSync("publish", { recursive: true });
}
Fs.mkdirSync("publish");

const paths = ["dist", "src", "moon.mod.json", "README.md", "LICENSE"];

for (const path of paths) {
  const stats = Fs.statSync(path);

  if (stats.isDirectory()) {
    // Create the directory in the publish folder
    const targetDir = Path.join("publish", path);
    if (!Fs.existsSync(targetDir)) {
      Fs.mkdirSync(targetDir, { recursive: true });
    }

    // Copy directory recursively
    copyDirSync(path, targetDir);
  } else {
    // Copy file
    Fs.copyFileSync(path, Path.join("publish", path));
  }
}

/**
 * Recursively copy a directory
 */
function copyDirSync(src: string, dest: string) {
  const entries = Fs.readdirSync(src, { withFileTypes: true });

  for (const entry of entries) {
    const srcPath = Path.join(src, entry.name);
    const destPath = Path.join(dest, entry.name);

    if (entry.isDirectory()) {
      Fs.mkdirSync(destPath, { recursive: true });
      copyDirSync(srcPath, destPath);
    } else {
      Fs.copyFileSync(srcPath, destPath);
    }
  }
}
