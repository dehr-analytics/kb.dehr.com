To allow acccess from your workstation to the Azure SQL database, you will have to add your IP to the Security - Networking area under Firewall rules.

First select Public access - Selected networks.

---
- Set Entra ID Admin (your main account for Azure)
- Set Microsoft Entra authenticaiton only
- Enable Managed Identity for Azure Function
  - Use the same identity to run the app as the one to connec to Azure SQL
 


- Enable Azure Active Directory authentication
  - Ensure there is an Azure AD admin configured for the database server
- Create the managed users in the database
- Enable authentication from your managed identity by creating a contained user


















### References
https://www.pluralsight.com/resources/blog/guides/how-to-use-managed-identity-with-azure-sql-database#:~:text=In%20order%20to%20allow%20managed,configured%20for%20the%20database%20server.