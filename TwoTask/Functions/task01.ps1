$FILE = "laiendid.txt"

if (!(Test-Path $FILE)) {
    Write-Host "Fail puudub!"
    exit 1
}

$RANDOM_EXTENSION = Get-Content $FILE | Get-Random

Add-Content -Path "random.txt" -Value $RANDOM_EXTENSION

Write-Host "Lisatud: $RANDOM_EXTENSION"