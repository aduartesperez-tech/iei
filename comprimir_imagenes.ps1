Add-Type -AssemblyName System.Drawing

$carpeta   = "$PSScriptRoot\IMG"
$respaldo  = "$PSScriptRoot\IMG_original"
$maxAncho  = 1920
$calidad   = 75

# Crear carpeta de respaldo
if (-not (Test-Path $respaldo)) {
    New-Item -ItemType Directory -Path $respaldo | Out-Null
}

# Encoder JPEG
$encoder       = [System.Drawing.Imaging.Encoder]::Quality
$encParams     = New-Object System.Drawing.Imaging.EncoderParameters(1)
$encParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter($encoder, [long]$calidad)
$codecJpeg     = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() |
                 Where-Object { $_.MimeType -eq 'image/jpeg' }

Write-Host "`n=== Compresion de imagenes IEI ===" -ForegroundColor Cyan
Write-Host "Respaldo en: $respaldo`n"

Get-ChildItem $carpeta -Filter *.jpg | ForEach-Object {

    $archivoOrig = $_.FullName
    $nombre      = $_.Name
    $tamanoAntes = [math]::Round($_.Length / 1KB, 1)

    # Copiar original al respaldo (solo si no existe ya)
    $destRespaldo = Join-Path $respaldo $nombre
    if (-not (Test-Path $destRespaldo)) {
        Copy-Item $archivoOrig $destRespaldo
    }

    # Abrir imagen
    $img = [System.Drawing.Image]::FromFile($archivoOrig)

    if ($img.Width -gt $maxAncho) {
        $ratio     = $maxAncho / $img.Width
        $nuevoAlto = [int]($img.Height * $ratio)
        $bmp       = New-Object System.Drawing.Bitmap($maxAncho, $nuevoAlto)
        $g         = [System.Drawing.Graphics]::FromImage($bmp)
        $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $g.DrawImage($img, 0, 0, $maxAncho, $nuevoAlto)
        $g.Dispose()
        $img.Dispose()
        $bmp.Save($archivoOrig, $codecJpeg, $encParams)
        $bmp.Dispose()
    } else {
        $bmp = New-Object System.Drawing.Bitmap($img)
        $img.Dispose()
        $bmp.Save($archivoOrig, $codecJpeg, $encParams)
        $bmp.Dispose()
    }

    $tamanoDepues = [math]::Round((Get-Item $archivoOrig).Length / 1KB, 1)
    $ahorro       = [math]::Round((1 - $tamanoDepues / $tamanoAntes) * 100, 0)
    Write-Host ("  {0,-25} {1,7} KB  ->  {2,7} KB  ({3}% menos)" -f $nombre, $tamanoAntes, $tamanoDepues, $ahorro) -ForegroundColor Green
}

Write-Host "`nListo. Originales guardados en IMG_original`n" -ForegroundColor Cyan
