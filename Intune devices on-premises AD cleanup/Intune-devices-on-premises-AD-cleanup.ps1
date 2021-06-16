####Author: Niklas Tinner
#This script will query your Intune tenant, as well as your local Active Directory, where Intune devices are stored. Subsequently all records of computers that are
#only existing in AD, but not in Intune, will be listed and can be deleted. Please make sure that you run this script with access to Active Directory and use an
#account for 365 authentication, that can use Intune Graph to get device information.

#Run the script at your own responsibility. It is meant to do the best, but without any warranty. (Make sure you have a backup or the AD recycle bin enabled for emergency.)


#Install Intune Graph module if required
If ((get-module -ListAvailable -Name Microsoft.Graph.Intune) -eq $null){
    Install-Module -Name Microsoft.Graph.Intune -force
}

#Connect to MSGraph
Connect-MSGraph -AdminConsent

#Save all Windows devices from Intune into an arry
$IntuneWindevices = @()
$IntuneWindevices = Get-IntuneManagedDevice | Where-Object {$_.operatingsystem -eq 'Windows' -and $_.managedDeviceOwnerType -eq "company"} | Select -ExpandProperty "deviceName"


#Query OU$ from which the hybrid joined computers are located
$OU = Read-Host "Please specify organizational unit (OU), where ONLY Intune devices are in"

#Get local AD computers and save to another array
$ADdevices = @()
$ADdevices = Get-ADComputer -Filter * -SearchBase "$OU" | Select -ExpandProperty "Name"


#Count Intune/AD devices to ensure correct data records
$IntuneWindevicescount = [int]$IntuneWindevices.count
Write-Host "$IntuneWindevicescount devices found in Intune that have a Windows OS and are company-owned."

$ADdevicescount = [int]$ADdevices.count
Write-Host "$ADdevicescount found in local AD, where OU is $OU."

$differencedevices = $ADdevicescount - $IntuneWindevicescount
Write-Host "$differencedevices devices in local AD are not existing in Intune. (if minus count, then these are probably only deleted on-prem, but not Intune, or are Azure AD only devices."


#Operation for deleting computer objects
do { $userInput = (Read-Host "Do you want to delete local records of computers that are not existing in Intune? (Y/N)").ToLower() } while ($userInput -notin @('y','n'))
if ($userInput -eq 'y') {

    ##Loop compare each position from AD array with all Intune array entries

	Write-Host "The following devices do not exist in Intune:"
	
    #Loop AD devices
    for ($i=0; $i -lt $ADdevices.length; $i++){
        
		$flag = "false"
		
        #Loop Intune devices
        for ($k=0; $k -lt $IntuneWindevices.length; $k++){
            
            #Check if the AD device matches with an Intune record
            if ($ADdevices[$i] -eq $IntuneWindevices[$k]) {
                $flag = "true"
				break
            }
            else {
                $flag = "false"
            }
            
        }
		
		#Delete non existing records in AD
        if ($flag -eq "false") {
			$currentdevice = $ADDevices[$i]
            Write-Host "$currentdevice"
            #Deleting deivces
            Get-ADComputer -Filter {Name -eq $currentdevice} -Searchbase "$OU" | Remove-ADObject -Confirm:$false -recursive
               
        }
        
    }
  

} else {
	Write-Host "Script will cancel. No operation performed."
	
}

