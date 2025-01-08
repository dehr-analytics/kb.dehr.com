$ErrorActionPreference = "Stop"

Write-Host 'Pushing changes to Git for my app!';

$dir = $env:USERPROFILE + "\source\repos\statscale.io\"
Set-Location $dir

# & .\gentoc.ps1

Write-Output '';
Write-Output 'Adding locally...'
git add .

Write-Output '';
Write-Output "Committing locally..."
git commit -m 'Scripted commit'

Write-Output '';
Write-Output "Pulling latest from git..."
git pull origin main

Write-Output '';
Write-Output "Pushing latest to git..."
git push origin main

Write-Output '';
Write-Host 'Finished!';
Start-Sleep -Seconds 1