# scripts/generate-assets.ps1
# ─────────────────────────────────────────────────────────────────────────────
# Generates all favicon, icon, and OG image assets from a single logomark file.
# Run from the project root after cloning.
#
# Requires: ImageMagick (magick) — https://imagemagick.org
#
# Inputs (you provide):
#   public/brand/logomark.png  — 1024×1024 recommended, dark mark on transparent bg
#   public/brand/banner.png   — 1280×320, for README (optional)
#
# Outputs (auto-generated — do not edit these by hand):
#   public/icon-light.png     — favicon shown in light mode (dark mark)
#   public/icon-dark.png      — favicon shown in dark mode  (white mark)
#   public/icon.png           — 1024×1024 for manifest + JSON-LD (dark bg, white mark)
#   public/favicon.ico        — legacy multi-res (48/32/16px)
#   src/app/apple-icon.png    — 180×180 iOS home screen (dark bg, white mark)
#   public/og-image.png       — 1200×630 social card
# ─────────────────────────────────────────────────────────────────────────────

# Run from repo root regardless of where the script is called from
Set-Location (Split-Path -Parent $PSScriptRoot)

$logomark = "public\brand\logomark.png"
$banner   = "public\brand\banner.png"

# ── Guards ────────────────────────────────────────────────────────────────────
if (-not (Test-Path $logomark)) {
    Write-Host ""
    Write-Host "  ERROR: $logomark not found." -ForegroundColor Red
    Write-Host "  Drop your 1024x1024 logomark (dark mark, transparent bg) at that path and re-run." -ForegroundColor Yellow
    Write-Host ""
    exit 1
}

if (-not (Get-Command magick -ErrorAction SilentlyContinue)) {
    Write-Host ""
    Write-Host "  ERROR: ImageMagick not found." -ForegroundColor Red
    Write-Host "  Install from https://imagemagick.org then re-run." -ForegroundColor Yellow
    Write-Host ""
    exit 1
}

if (-not (Test-Path $banner)) {
    Write-Host ""
    Write-Host "  WARNING: public/brand/banner.png not found." -ForegroundColor Yellow
    Write-Host "  Create a 1280x320 banner and drop it there to update the README image." -ForegroundColor Yellow
    Write-Host "  Continuing without it..." -ForegroundColor Yellow
    Write-Host ""
}

Write-Host ""
Write-Host "  Generating assets from $logomark" -ForegroundColor Cyan
Write-Host ""

# ── Favicon pair (dark/light mode) ───────────────────────────────────────────
# icon-light.png: dark mark shown in light mode — copy source as-is
Copy-Item $logomark "public\icon-light.png"
Write-Host "  + public/icon-light.png"

# icon-dark.png: white mark shown in dark mode — invert source
magick $logomark -channel RGB -negate "public\icon-dark.png"
Write-Host "  + public/icon-dark.png"

# ── icon.png: manifest + JSON-LD ─────────────────────────────────────────────
# 1024x1024, dark bg, centered white mark
magick -size 1024x1024 xc:"#111111" `
    '(' $logomark -channel RGB -negate -resize 800x800 ')' `
    -gravity Center -composite "public\icon.png"
Write-Host "  + public/icon.png"

# ── apple-icon.png: iOS home screen ──────────────────────────────────────────
# 180x180, dark bg, centered white mark
if (-not (Test-Path "src\app")) { New-Item -ItemType Directory -Path "src\app" | Out-Null }
magick -size 180x180 xc:"#111111" `
    '(' $logomark -channel RGB -negate -resize 140x140 ')' `
    -gravity Center -composite "src\app\apple-icon.png"
Write-Host "  + src/app/apple-icon.png"

# ── favicon.ico: legacy multi-resolution ─────────────────────────────────────
magick $logomark -define icon:auto-resize=48,32,16 "public\favicon.ico"
Write-Host "  + public/favicon.ico"

# ── og-image.png: 1200x630 social card ───────────────────────────────────────
# Reads site name from src/config/site.ts if present; falls back to placeholder.
# Re-run this script after filling in site.ts to get your real name in the card.
$siteName = "Your Site"
$siteTs = "src\config\site.ts"
if (Test-Path $siteTs) {
    $nameLine = Select-String -Path $siteTs -Pattern "name:\s*'([^']+)'" | Select-Object -First 1
    if ($nameLine) {
        $match = [regex]::Match($nameLine.Line, "name:\s*'([^']+)'")
        if ($match.Success -and $match.Groups[1].Value -notmatch 'TODO') {
            $siteName = $match.Groups[1].Value
        }
    }
}
Write-Host "  + public/og-image.png (site name: $siteName)"
magick -size 1200x630 xc:"#111111" `
    '(' $logomark -channel RGB -negate -resize 100x100 ')' `
    -gravity North -geometry +0+75 -composite `
    -gravity North -font "Arial-Bold" -pointsize 88 -fill "#e5e5e5" -annotate +0+230 $siteName `
    -fill "#6366f1" -draw "rectangle 0,618 1200,630" `
    "public\og-image.png"

Write-Host ""
Write-Host "  Done." -ForegroundColor Green
if ($siteName -eq "Your Site") {
    Write-Host "  Tip: fill in src/config/site.ts, then re-run to get your site name on the OG image." -ForegroundColor Gray
}
Write-Host ""
