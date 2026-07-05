# Convert SVG/PNG assets to WebP (requires ImageMagick `magick` or `cwebp`)
# Run from project root: .\convert-images.ps1

$assets = @(
  'assets/shumba-wheels.svg',
  'assets/raindrop-driving.svg',
  'assets/kingdom-power.svg',
  'assets/zimmarket.svg',
  'assets/portrait.svg'
)

function Convert-WithMagick($src, $dst) {
  Write-Host "magick convert $src $dst"
  magick convert $src $dst
}

function Convert-WithCwebp($src, $dst) {
  # cwebp expects raster input; if source is SVG, ImageMagick or librsvg must be available
  Write-Host "cwebp $src -o $dst"
  & cwebp $src -q 85 -o $dst
}

foreach ($f in $assets) {
  if (-Not (Test-Path $f)) {
    Write-Host "WARN: Source not found: $f" -ForegroundColor Yellow
    continue
  }
  $base = [System.IO.Path]::GetFileNameWithoutExtension($f)
  $dir = [System.IO.Path]::GetDirectoryName($f)
  $out1 = Join-Path $dir "$base.webp"
  $out2 = Join-Path $dir "$base@2x.webp"

  if (Get-Command magick -ErrorAction SilentlyContinue) {
    Convert-WithMagick $f $out1
    Convert-WithMagick $f $out2
  } elseif (Get-Command cwebp -ErrorAction SilentlyContinue) {
    Convert-WithCwebp $f $out1
    Convert-WithCwebp $f $out2
  } else {
    Write-Host "No converter found (magick or cwebp). Install ImageMagick or libwebp and re-run." -ForegroundColor Red
    break
  }
}
