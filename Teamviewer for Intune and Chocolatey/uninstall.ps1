#Check for previous installations
if (Test-Path 'C:\Program Files (x86)\TeamViewer\TeamViewer.exe') {
    
    net stop TeamViewer

    #Uninstall TeamViewer
    choco uninstall TeamViewer.Host -y

    #If you want to uninstall complete Chocolatey, take a look on this site: https://docs.chocolatey.org/en-us/choco/uninstallation
    #choco uninstall choco-upgrade-all-at -y

}