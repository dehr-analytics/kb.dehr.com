Remove-Item _site -Recurse -Force -Confirm:$false
docfx build 
docfx docfx.json --serve