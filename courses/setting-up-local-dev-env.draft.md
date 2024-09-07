Title: Setting up local .net core development environment
Published: 12/12/2099
Tags:
- .Net Core
---

Whan lauching your .Net Core web project for the first time, you may run into this SSL error: `NET::ERR_CERT_INVALID`.

Make sure to set your local certificate as trusted:

```powershell
dotnet dev-certs https --trust
```

Setting up the server environment for .NET Core web app

- When an app is published, the IIS complains about its web.config authentication settings.  We have to give the right file permissions on the folder used in IIS first:
  - IISAppPool\[app pool name]
  - IUSR (account internal to the server)
- If you're not using DevOps pipelines, give your domain or machine account permissions to the webapp folder on the server so that you can publish to it
- 
