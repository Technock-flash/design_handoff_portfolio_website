This folder contains the vector/source assets used by the prototype.

Production optimizations expected:

- Generate WebP variants for each image (1x and @2x) named like `shumba-wheels.webp` and `shumba-wheels@2x.webp`.
- Use `convert-images.ps1` from the project root to create WebP files (requires ImageMagick `magick` or `cwebp`).
- Replace SVGs with high-resolution PNGs if the screenshots are raster; keep SVGs for vector artwork.

Files referenced by the site but not present as WebP will fall back to the original SVGs.

Screenshots provided by the client for Shumba Wheels:

- `shumba-screen-1.png` — main dashboard / hero screenshot
- `shumba-screen-2.png` — bookings / mobile screenshot

ZimMarket screenshot provided by the client:

- `zimmarket-screen-1.png` — main ZimMarket homepage screenshot (place in `assets/`)

Raindrop screenshots provided by the client:

- `raindrop-screen-1.png` — Raindrop login / hero screenshot
- `raindrop-screen-2.png` — Raindrop courses / mobile screenshot

Shumba Wheels screenshots provided by the client:

- Source: `C:\Users\lenovo\Pictures\Screenshots\shumba wheels.png`
- Source: `C:\Users\lenovo\Pictures\Screenshots\Screenshot 2026-07-02 214739.png`

Recommended: copy and rename these into the project `assets/` folder using PowerShell (run from the project root):

```powershell
# Copy and rename Shumba screenshots into the project
Copy-Item "C:\Users\lenovo\Pictures\Screenshots\shumba wheels.png" .\assets\shumba-screen-1.png -Force
Copy-Item "C:\Users\lenovo\Pictures\Screenshots\Screenshot 2026-07-02 214739.png" .\assets\shumba-screen-2.png -Force

# Then generate WebP variants (optional)
.\convert-images.ps1
```

Notes:
- Filenames with spaces are quoted above and will be copied and renamed to safer filenames used by the site: `shumba-screen-1.png` and `shumba-screen-2.png`.
- If you prefer different destination names, update the copy commands and the image references in the HTML pages accordingly.

Place these files into this `assets/` folder. After placing them you can run `convert-images.ps1` to create WebP variants.

ZimMarket screenshots provided by the client:

- Source: `C:\Users\lenovo\Pictures\Screenshots\Screenshot 2025-11-11 171242.png`
- Source: `C:\Users\lenovo\Pictures\Screenshots\Screenshot 2026-07-02 220936.png`

Copy and rename these into the project `assets/` folder with PowerShell (run from the project root):

```powershell
Copy-Item "C:\Users\lenovo\Pictures\Screenshots\Screenshot 2025-11-11 171242.png" .\assets\zimmarket-screen-1.png -Force
Copy-Item "C:\Users\lenovo\Pictures\Screenshots\Screenshot 2026-07-02 220936.png" .\assets\zimmarket-screen-2.png -Force

# Optional: generate WebP variants (requires ImageMagick or cwebp)
.\convert-images.ps1
```

After copying, the site will reference `zimmarket-screen-1.png` and `zimmarket-screen-2.png` (and their WebP fallbacks if generated).

Portrait (your photo)

To use your JPG portrait on the site, copy it into `assets/` as `portrait.jpg`:

```powershell
Copy-Item "C:\Users\lenovo\Pictures\IMG_2752.JPG" .\assets\portrait.jpg -Force

# Then generate WebP variants (optional but recommended):
.\convert-images.ps1
```

Kingdom Power screenshots provided by the client:

- Source: `C:\Users\lenovo\Pictures\Screenshots\Screenshot 2025-11-11 213040.png`
- Source: `C:\Users\lenovo\Pictures\Screenshots\Screenshot 2026-07-04 170146.png`

Copy these into the project `assets/` folder with the expected names:

```powershell
Copy-Item "C:\Users\lenovo\Pictures\Screenshots\Screenshot 2025-11-11 213040.png" .\assets\kingdom-screen-1.png -Force
Copy-Item "C:\Users\lenovo\Pictures\Screenshots\Screenshot 2026-07-04 170146.png" .\assets\kingdom-screen-2.png -Force

# Optional: generate WebP variants
.\convert-images.ps1
```
