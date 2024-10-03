$ErrorActionPreference = "Stop"

Write-Host 'Pushing changes to Git for my app!';

$dir = $env:USERPROFILE + "\source\repos\docs.statscale.com\"
Set-Location $dir

docfxtocgenerator -d ./guides -vs
docfxtocgenerator -d ./kb -vs

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