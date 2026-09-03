param(
    [Parameter(Mandatory = $true)] [string] $Source,
    [Parameter(Mandatory = $true)] [string] $Animation,
    [Parameter(Mandatory = $true)] [int] $Columns,
    [Parameter(Mandatory = $true)] [int] $Rows
)

# Splits a transparent ImageGen contact sheet into the runtime's 512x512 PNG frames.
Add-Type -AssemblyName System.Drawing
$destination = Join-Path $PSScriptRoot "..\assets\pets\mage2d\$Animation"
$sheet = [System.Drawing.Image]::FromFile($Source)
$cellWidth = [math]::Floor($sheet.Width / $Columns)
$cellHeight = [math]::Floor($sheet.Height / $Rows)

for ($index = 0; $index -lt ($Columns * $Rows); $index++) {
    $column = $index % $Columns
    $row = [math]::Floor($index / $Columns)
    $sourceRect = [System.Drawing.Rectangle]::new($column * $cellWidth, $row * $cellHeight, $cellWidth, $cellHeight)
    $frame = [System.Drawing.Bitmap]::new(512, 512, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $graphics = [System.Drawing.Graphics]::FromImage($frame)
    $graphics.Clear([System.Drawing.Color]::Transparent)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $height = [int](512 * $cellHeight / $cellWidth)
    $top = [int]((512 - $height) / 2)
    $graphics.DrawImage($sheet, [System.Drawing.Rectangle]::new(0, $top, 512, $height), $sourceRect, [System.Drawing.GraphicsUnit]::Pixel)
    $frame.Save((Join-Path $destination ('{0}_{1:D4}.png' -f $Animation, ($index + 1))), [System.Drawing.Imaging.ImageFormat]::Png)
    $graphics.Dispose()
    $frame.Dispose()
}

$sheet.Dispose()
Write-Output "${Animation}: $($Columns * $Rows) frames exported"
