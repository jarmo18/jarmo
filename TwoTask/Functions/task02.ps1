function Task02 {

    param(
        [string]$laiend
    )

    $EXT_FILE = "laiendid.txt"
    $OUT_FILE = "random.txt"

    if (!(Test-Path $EXT_FILE)) {
        Write-Host "Faili '$EXT_FILE' ei leitud!"
        return
    }

    if (!(Test-Path $OUT_FILE)) {
        Write-Host "Faili '$OUT_FILE' ei leitud!"
        return
    }

    if (-not $laiend) {
        $laiend = Read-Host "Mis laiendit otsida tahad?"
    }

    $extensions = Get-Content $EXT_FILE

    if ($extensions -notcontains $laiend) {
        Write-Host "Laiendit '$laiend' ei leitud failist '$EXT_FILE'."
        return
    }

    $randomExtensions = Get-Content $OUT_FILE

    $kogus = ($randomExtensions | Where-Object { $_ -eq $laiend }).Count

    if ($kogus -gt 0) {
        Write-Host "Laiend '$laiend' leiti random.txt failist $kogus korda."
    }
    else {
        Write-Host "Laiend '$laiend' random.txt failist ei leitud."
    }
}