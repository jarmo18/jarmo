# Kontrollime, kas kasutaja andis laiendi argumendina
if ($args.Count -eq 0) {
    Write-Host "Palun sisesta otsitav laiend käsureal."
    Write-Host "Näide: powershell -File task.02.ps txt"
    exit 1
}

# Laiendi salvestamine muutujasse
$extension = $args[0]

# Faili kontroll
$file = "random.txt"

if (!(Test-Path $file)) {
    Write-Host "Fail '$file' ei leidu. Käivita kõigepealt task01.ps."
    exit 1
}

# Loeme mitu korda laiend esineb
$count = (Get-Content $file | Where-Object { $_ -eq $extension }).Count

# Tulemuse kuvamine
if ($count -gt 0) {
    Write-Host "Laiend '$extension' esineb $count korda."
}
else {
    Write-Host "Laiend '$extension' ei leitud."
}