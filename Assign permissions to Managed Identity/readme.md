# Azure Managed Identity - Assign permissions to Managed Identity Enterprise Application with PowerShell

> Find more information in my corresponding blog post: oceanleaf.ch/azure-managed-identity/

The Managed Identity can be used to retrieve Azure Active Directory data. This works through an Enterprise Application that has Graph API permissions assigned. As of now, we need to assign the permissions through PowerShell with **New-AzureADServiceAppRoleAssignment**

Replace the following in the script:
* Copy the Object (principal) ID from Azure and replace it (explained below)
* Insert the desired Graph API permission. Find all [Graph API permissions](https://learn.microsoft.com/en-us/graph/permissions-reference)

What you individually need for this, is the **Managed Identity Object (principal) ID**, that can be found through one of these ways:

### Azure resource instance
The ID is in the service instance/resource under Identity.

![managed-identity-status](https://oceanleaf.ch/content/images/2022/09/managed-identity-status.png)

### Azure AD Enterprise application
The Managed Identites are also found under [AzureAD>Enterprise Applications](https://portal.azure.com/#view/Microsoft_AAD_IAM/StartboardApplicationsMenuBlade/~/AppAppsPreview/menuId~/null). Set the filter to 'Application type == Managed Identites'. The name is equal to the Azure resource instance.

![ea](https://oceanleaf.ch/content/images/2022/09/ea.png)

![copy-objectprincipalid](https://oceanleaf.ch/content/images/2022/09/copy-objectprincipalid.png)

