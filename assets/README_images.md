This folder contains the vector/source assets used by the prototype.

Production optimizations expected:

- Generate WebP variants for each image (1x and @2x) named like `shumba-wheels.webp` and `shumba-wheels@2x.webp`.
- Use `convert-images.ps1` from the project root to create WebP files (requires ImageMagick `magick` or `cwebp`).
- Replace SVGs with high-resolution PNGs if the screenshots are raster; keep SVGs for vector artwork.

Files referenced by the site but not present as WebP will fall back to the original SVGs.
