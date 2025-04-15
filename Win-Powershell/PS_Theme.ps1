# Step 1: Install Oh My Posh using winget
Write-Host "Installing Oh My Posh via winget..."

Write-Host "Checking if winget is installed..."
if (Get-Command winget -ErrorAction SilentlyContinue) {
    Write-Host "winget is installed. Current version:"
    winget --version
}
else {
    Write-Host "winget is not installed. Please install winget"
    exit
}
Write-Host "Installing Oh-My-Posh..."
winget install JanDeDobbeleer.OhMyPosh -s winget

# Step 2: Set up PowerShell profile for Oh My Posh
Write-Host "Configuring PowerShell profile..."
$profilePath = $PROFILE
if (!(Test-Path $profilePath)) {
    Write-Host "Creating PowerShell profile..."
    New-Item -Path $profilePath -Type File -Force
}

# Optional: Set a theme (replace 'themePath' with your preferred theme)
$themePath = "https://raw.githubusercontent.com/Marcel-Driesener/Shell_Themes/refs/heads/main/Win-Powershell/oh-my-posh-theme/darkblood-custom.omp.json"
Add-Content -Path $profilePath -Value "oh-my-posh upgrade | oh-my-posh init pwsh --config '$themePath' | Invoke-Expression"

Write-Host "PowerShell profile updated. Restart PowerShell to apply changes."