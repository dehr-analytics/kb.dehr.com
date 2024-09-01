# Git Guide

A few handy commands in one handy place.

### Updating .gitignore and enforcing it

In some situations like when you need to skip a file from your repository, you may want to add it to your ``.gitignore``.  After you make changes to your ``.gitignore`` file, you have to remove the cached files from the local repository, add them back, commit again to the local and push to the remote repositories.  

```git
git rm -r --cached .
git add .
git commit -m ""
```

To push the locally committed changes back to your remote repo:

```git
git push
```

### PowerShell script to sync it up both ways

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
Write-Host 'Finished!';
Start-Sleep -Seconds 1
```

### Switching accounts from any command prompt

This command will allow you to switch the account when working with Git in the command prompt:

```git
git config credential.username "new@account.com"
```

However, this pops up the Git window to sign-in each time you run a git command.

Also, it's worthwhile to check if your default branch is main and not master.

Check the ``init.defaultbranch`` by running ``git config --list``.  To change it to ``main``, run ``git config --global init.defaultbranch main``.

