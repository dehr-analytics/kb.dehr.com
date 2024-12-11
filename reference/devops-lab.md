# Deploying apps to your on-premise servers from Azure DevOps

- Create a build in Azure DevOps
- Create deployment groups on the on-premise servers
- Create the release pipeline

## Create a build

## Creating a release

- Create dev and prod stage
- 

## Database deployment process

- DevOps world has database projects
- Check in the schema to your source control
- Your source control has source for your app and database schema - all versioned together
- When working on schema, you work in your database project and check it into source control first
- Once database project is checked-in, a pull request may be triggered to do a build
- When the build happens, the build artifact that comes out is called the DACPAC
- DACPAC - schema of the database - flattened to an XML file
- Deploying a database compares the DACPAC and the schema of the production database
- It will then autogenerate scripts needed to make the production database same as the intended new project schema