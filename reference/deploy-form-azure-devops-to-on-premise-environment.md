# Deploy from Azure DevOps to On-Premise Environment

With Azure DevOps, you can deploy from Azure DevOps to on-premise server to run an app.  No changes to the firewall are required, the servers only run the agents that will reach out to the DeVops and pull down the deployed app(s) down to the on-prem server(s).

- Create a build in Azure DevOps
- Create deployment groups on the on-premise servers
- Create the release pipeline

## Create a build

- In DevOps repo, go to Builds and click on New > New build pipeline
- Pick the source repository and the branch
- Pick the ASP.NET template or a specific template to your language code
- Select Build solution (the .sln file)
- For Test filter criteria, set your criteria, i.e. TestCategory=Unit Test
- For the database part, create a Copy files step, and pick the source folder ``${build.sourcedirectory}``, Contents as ``**\bin\${BuildConfiguration}\**`` (the asterisks mean its recursive), and target folder as ``${build.artifactstagingdirectory}``


## Creating deployment groups

- Go to Deployment groups and create a new one
- When you create a deployment group, the Registration script (PowerShell) that shows up is the code that you will need to run on the deployment server to install the agent
- Open a PowerShell window in your deployment target server, and run the PowerShell script
- When you run the PowerShell to create the agent, you'll need the service account to run the agent
- Make sure to select ``Use a personal access token in the script for authentication`` to handle the authentication
- The new target will show up in the Deployment groups in DevOps


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

## References

- <a href="https://www.youtube.com/watch?v=_sUf0wqJYXo" target="window">Part 1</a>
- <a href="https://www.youtube.com/watch?v=58UfRxxAWhE" target="window">Part 2</a>
- <a href="https://www.youtube.com/watch?v=S90pG8zDlEA" target="window">Part 3</a>
- <a href="https://learn.microsoft.com/en-us/sql/relational-databases/data-tier-applications/data-tier-applications?view=sql-server-ver16">Data-tier applications (DAC)</a>
