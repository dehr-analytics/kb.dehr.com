# Finding Error Details in SharePoint Server

```
Get-SPLogEvent | ?{$_.Correlation -eq "a12345678-b987-1234-1234-123456789012"}
```
