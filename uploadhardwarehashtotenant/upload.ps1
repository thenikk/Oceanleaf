####Author: Niklas Tinner
#This script was made as an addition to "Get-WindowsAutoPilotInfo" for registering the individual hardware hash id 
#from a device into a Microsoft 365 Intune tenant, for device enrollment to be super simple & reusable. 
#You can find the page with all already uploaded hashes under: https://endpoint.microsoft.com/ Devices > Enroll devices > Devices.

####Script is using the following subscripts, content or resources:
##https://www.powershellgallery.com/packages/Get-WindowsAutoPilotInfo/3.5 by Michael Niehaus
##https://www.powershellgallery.com/packages/Get-AutopilotDiagnostics/5.6 by Michael Niehaus



###Function to upload hardware hash
function uploadHardwareHashtoTenant() {

	#Switch script location local/Powershell gallery
	Set-Location -Path $scriptPath
	#Run script to import device hash to tenant with parameters, make sure to authenticate with matching permissions
	.\Get-WindowsAutoPilotInfo.ps1 -GroupTag $grouptag -AssignedUser $assigneduser -AddToGroup $addToGroup -Online
	
}

###Function to register information from user and save later to config file
function querryUserforInformation()	{

	#Defining some more parameters for the hardware hash upload
	$grouptag = Read-Host "Please specify GroupTag"
	$assigneduser = Read-Host "Please specify assigned User"
	$addToGroup = Read-Host "Please specify AAD Group in which the device should be added"
	$timestamp = Get-Date
	
	#Creating an array for the config entries
	$array_load = @()
	$array_load+= "File created:$timestamp"
	$array_load+= "Powershell_script_source=$scriptPath"
	$array_load+= "GroupTag=$grouptag"
	$array_load+= "assignedUser=$assigneduser"
	$array_load+= "addToGroup=$addToGroup"
	$array_load+= "created by Niklas Tinner"

	#Write config file from used parameters
	$array_load | Out-File -FilePath $PSScriptRoot\config.txt
	
	#Trigger function to register hardware hash
	uploadHardwareHashtoTenant
	
}

###Check for config.txt file
if (Test-Path -Path "$PSScriptRoot\config.txt") {

	###Read config file
	$array_read = @()

	#Fill array with splitted content
	Get-Content -path "$PSScriptRoot\config.txt" | Foreach-Object {
  	$loadconfig = $_.Split('=')
	$array_read+= $loadconfig[1]
	}

	#Define array positions to variables
	$scriptPath = $array_read[1]
	$grouptag = $array_read[2]
	$assignedUser = $array_read[3]
	$addToGroup = $array_read[4]

	#Trigger function
	uploadHardwareHashtoTenant
	
} 
###If no config.txt file exists in same directory, user will be promted to deliver some information
else {

	###Querry for using online Powershell Gallery scripts or use "offline" script in same folder
do { $userInput = (Read-Host "Do you want to use latest Online scripts? (Y/N)").ToLower() } while ($userInput -notin @('y','n'))
if ($userInput -eq 'y') {

	#Install NuGet for Powershell Gallery (PackageProvider)
	Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

	###If Nuget installation fails, use following commands to use TLS 1.2 or higher (Source: https://docs.microsoft.com/en-us/powershell/module/powershellget/install-script?view=powershell-7.1)###
	#Set-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NetFramework\v4.0.30319' -Name 'SchUseStrongCrypto' -Value '1' -Type Dword
	#Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\.NetFramework\v4.0.30319' -Name 'SchUseStrongCrypto' -Value '1' -Type Dword
	#Install-PackageProvider -Name NuGet -Force

	###Online installation of most current Powershell subscripts (use parameter -Online to use)
	
	#Install script for hardware hash extraction and upload to Intune tenant
	Install-Script Get-WindowsAutoPilotInfo -Force

	#Additionally install script for troubleshooting in enrollment status page (ESP)
	#Install-Script Get-AutoPilotDiagnostics -Force
	
	#Save script source directory as default Powershell script path "C:\Program Files\WindowsPowerShell\Scripts" (latest/online)
	$scriptPath = Join-Path -Path ${env:ProgramFiles} -ChildPath WindowsPowerShell\Scripts

	#Trigger function to register infos
	querryUserforInformation

} else {
	
	#Save script source directory as local path (leightweight/offline)
	$scriptPath = $PSScriptRoot
	
	#Trigger function to register infos
	querryUserforInformation
	
}

}








