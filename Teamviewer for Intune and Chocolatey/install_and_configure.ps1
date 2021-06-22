#Check for previous installations

$application = Get-WmiObject -Class Win32_Product -Filter "Name = 'TeamViewer Host'"
if ($application -eq "TeamViewer Host") {
    
	#Stop service
	net stop TeamViewer

    #Uninstall TeamViewer
    $application.Uninstall()

}

#Install new TeamViewer via. Chocolatey https://community.chocolatey.org/packages/teamviewer.host
#IMPORTANT Chocolatey must be installed before! https://chocolatey.org/install, if you whish to install it here, remove the # before:
#Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')); refreshenv

$localprograms = choco list -localonly
if ($localprograms -like "*teamviewer.host*")
	{
	choco upgrade teamviewer.host -y --ignore-checksum
	}
	else
	{
		choco install teamviewer.host -y --ignore-checksum
	}


#Set configuration ID / registry key
$ConfigurationID = "INSERT_CONFIG_ID"
Set-ItemProperty "HKLM:\SOFTWARE\WOW6432Node\TeamViewer" -Name "InstallationConfigurationId" -Value "$ConfigurationID"

#Set APIToken for easy access
$ApiToken = "INSERT_API_TOKEN"
$ComputerName = $ENV:COMPUTERNAME

Set-Location "C:\Program Files (x86)\TeamViewer\"
.\TeamViewer.exe assign --api-token $ApiToken --grant-easy-access --reassign --alias $ComputerName

#restart TeamViewer Host
net stop TeamViewer
Start-Sleep -s 5
net start TeamViewer

#Set custom registry key (for Intune detection)
Set-ItemProperty "HKLM:\SOFTWARE\WOW6432Node\TeamViewer" -Name "versionspecific" -Value "Host-Chocolatey-1"

#This is a Chocolatey package, which updates TeamViewer every day at 12pm, remove the # before:
#choco install choco-upgrade-all-at --params "'/DAILY:yes /TIME:12:00 /ABORTTIME:14:30'" -y