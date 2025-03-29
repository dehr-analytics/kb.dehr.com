# Setup for Local .NET Development

This is very much in progress.

## Install .NET on your local machine

- Download and install the latest .NET from <a href="https://dotnet.microsoft.com/en-us/download" target="_blank">Microsoft</a>.
- Download and install the Visual Studio 2022 and Visual Studio Code

## Install the git CLI tool for your environment
- <a href="https://git-scm.com/downloads" target="_blank">Git CLI</a>
- Installation of Git is documented in the Git Guide

## Local cert issue resolution

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

