# Setup for Local .NET Development

This is very much in progress.

## Install the git CLI tool for your environment
- <a href="https://git-scm.com/downloads" target="_blank">Git CLI</a>

## Local cert issues

When lauching your .Net project for the first time, you may run into this SSL error: `NET::ERR_CERT_INVALID`.

Make sure to set your local certificate as trusted:

```powershell
dotnet dev-certs https --trust
```

Setting up the server environment for .NET web app:

- When an app is published, the IIS complains about the app's web.config authentication settings.  We have to give the right file permissions on the folder used in IIS first:
  - ``IISAppPool\[app pool name]``
  - ``IUSR`` (account internal to the server)
- If you're not using DevOps pipelines, give your domain or machine account permissions to the web app folder on the server so that you can publish to it.

