#Author: Niklas Tinner, 25.09.2022

###############
## Variables ##
###############

#Specify the Managed Identity. You can find it in the Azure resource instance under Managed Identity, or in the Enterprise Applications, when filtering for "Managed Identity"
$ObjectPrincipalID = "<Insert the Object (principal ID) of your Managed Identity>"
#Specify the app, where the access should be granted for. Microsoft Graph ID is the same in all tenants = "00000003-0000-0000-c000-000000000000"
$appId = "00000003-0000-0000-c000-000000000000"
#Specify the API permissions
$permissions = "<Insert permission name>", "<Insert next permission name>" #Example: "Directory.Read.All", "Device.Read.All" find all at: https://learn.microsoft.com/en-us/graph/permissions-reference

###############
## Execution ##
###############

#Make sure, the module AzureAD is installed (Install-Module AzureAD) and connect to AzureAD. Authenticate with an account that has Application Administrator role assigned.
Connect-AzureAD

#Find the application in AzureAD through the previously specified $appId
$app = Get-AzureADServicePrincipal -Filter "AppId eq '$appId'"

#Assign all permissions to the Managed Identity service principal
foreach ($permission in $permissions)
{
   $role = $app.AppRoles | where Value -Like $permission | Select-Object -First 1
   New-AzureADServiceAppRoleAssignment -Id $role.Id -ObjectId $ObjectPrincipalID -PrincipalId $ObjectPrincipalID -ResourceId $app.ObjectId
}

###############
## Reference ##
###############
#Find more information in the corresponding blog post: https://oceanleaf.ch/azure-managed-identity/