Title: Git Guide
Published: 01/27/2024
Tags:
    - PowerShell
    - Git
---

A few handy commands in one handy place.

<!--
### Getting down a clone of a project

```git
git clone 
```
-->


### Enforcing an update to the .gitignore list [](#){name=enforcing-an-update-to-the-.gitignore-list}

In some situations like when you need to skip a file from your repository, you may want to add it to your ``.gitignore``.  After you make changes to your .gitignore file, you have to remove the cached files from the local repository, add them back, commit again to the local and push to the remote repositories.  

```git
git rm -r --cached .
git add .
git commit -m ""
```

To push the locally committed changes back to your remote repo:

```git
git push origin master
```

### PowerShell script to sync up git

This is a handy script I keep on my desktop (or an easy to find document folder) which I launch whenever I work with documents outside of a coding tool that need to be quickly pushed to Git.

```powershell
Write-Host 'Pushing changes to Git for my app!';

$dir = "C:\Users\username\source\repos\appname\"
Set-Location $dir

Write-Output '';
Write-Output 'Adding locally...'
git add .

Write-Output '';
Write-Output "Committing locally..."
git commit -m 'Scripted commit'

Write-Output '';
Write-Output "Pulling latest from git..."
git pull origin master

Write-Output '';
Write-Output "Pushing latest to git..."
git push origin master

Write-Output '';
Write-Host 'Finito!';
Start-Sleep -Seconds 1
```

