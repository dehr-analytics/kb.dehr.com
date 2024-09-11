Title: .Net Core Razor Pages Notes
Published: 01/01/2099
Tags:
 - .Net Core
 - Razor Pages
 - Local Development
---

# [AllowAnonymous]

Make sure to not use [AllowAnonymous] as the attribute on an index class if building for Windows authentication and retrieving username using IHttpContextAccessor.  If AllowAnonymous is used the username will be blank. 

# Local SQL Server Express

In order to make use of the local SQL Server express, you must enable the authentication for allowing to create native SQL accounts for your apps. 

[Stackoverflow post](https://stackoverflow.com/questions/20923015/login-to-microsoft-sql-server-error-18456 ) 