To allow acccess from your workstation to the Azure SQL database, you will have to add your IP to the Security - Networking area under Firewall rules.

First select Public access - Selected networks.

---
- Set Entra ID Admin (your main account for Azure)
- Set Microsoft Entra authenticaiton only
- Enable Managed Identity for Azure Function
  - Use the same identity to run the app as the one to connec to Azure SQL
  - Search for manage identities in Azure, add an identity
  - Go back to the function app - Identity, and add the User assigned identity
  - Get the identity's object ID
  - Adding using Azure role assignments does not work, so doing it in sql:
  
SELECT name FROM sys.database_principals WHERE type = 'E';
CREATE USER [dealbit-testidentity] FROM EXTERNAL PROVIDER;
ALTER ROLE db_datareader ADD MEMBER [dealbit-testidentity];
ALTER ROLE db_datawriter ADD MEMBER [dealbit-testidentity];
SELECT name FROM sys.database_principals WHERE type = 'E';

First SELECT did not return results, but the second now did.

Configure Connection String in Azure Function


az login --identity --username a79c6db1-33c2-4bc7-bf8e-b60ee9a9b18b


az login --identity --username a79c6db1-33c2-4bc7-bf8e-b60ee9a9b18b

az identity list --query "[].{Name:name, ClientId:clientId, ResourceId:id}" -o table

az login --identity --username a79c6db1-33c2-4bc7-bf8e-b60ee9a9b18b



sqlcmd -S tcp:dealbit-test.database.windows.net,1433 -d dealbit-test -G -U "dealbit-testidentity"

az login --service-principal -u a79c6db1-33c2-4bc7-bf8e-b60ee9a9b18b --tenant 6d14cae9-f282-4971-823c-49e0c0a1f21c --allow-no-subscriptions


{"from":"ps@dehr.com","body":"Test","subject":"subject test"}


Category: Dealbit.Function.HttpSaveMail
EventId: 0
SpanId: 1741700430f7e1bf
TraceId: 289cda33959f88be8d2935ae8dede584
ParentId: 0000000000000000
AzureFunctions_InvocationId: 5c02b48a-2ba3-47f1-b3f0-e0b8c7f10eab
AzureFunctions_FunctionName: HttpSaveMail

SQL Connection Failed: ManagedIdentityCredential authentication failed: Service request failed.
Status: 400 (Bad Request)

Content:
{"statusCode":400,"message":"Unable to load the proper Managed Identity.","correlationId":"a90d4b60-c919-495b-a883-e15e9775d0c2"}

Headers:
Date: Tue, 25 Feb 2025 05:41:38 GMT
Server: Kestrel
Transfer-Encoding: chunked
X-CORRELATION-ID: REDACTED
Content-Type: application/json; charset=utf-8

See the troubleshooting guide for more information. https://aka.ms/azsdk/net/identity/managedidentitycredential/troubleshoot


Server=tcp:dealbit-test.database.windows.net,1433;Database=dealbit-test;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;















---
Step 4: Use Managed Identity in Azure Function
Ensure your function app uses the correct connection string in Configuration:

Server=tcp:yourserver.database.windows.net,1433;Database=YourDatabase;Authentication=Active Directory Default;


- Enable Azure Active Directory authentication
  - Ensure there is an Azure AD admin configured for the database server
- Create the managed users in the database
- Enable authentication from your managed identity by creating a contained user


















### References
https://www.pluralsight.com/resources/blog/guides/how-to-use-managed-identity-with-azure-sql-database#:~:text=In%20order%20to%20allow%20managed,configured%20for%20the%20database%20server.