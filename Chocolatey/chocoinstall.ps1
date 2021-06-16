#Choco installation / Online repo
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#refresh environmental variables
refreshenv

#******Package installation******

#***Browser***
choco install googlechrome -y
choco install microsoft-edge -y
#choco install firefox -y
#choco install opera -y
#choco install chromium -y

#***Office***
choco install adobereader -y
choco install pdfcreator -y
#choco install openoffice -y

#***Music***
choco install itunes -y

#***Creativity***
#choco install paint.net -y

#***Other***
#choco install dropbox -y
#choco install audacity -y


#***Systemtools***
choco install jre8 -y
choco install notepadplusplus.install -y
choco install winrar -y
choco install 7zip -y
#choco install filezilla -y
#choco install winscp.install -y
#choco install keepass.install -y
#choco install openvpn -y


#***Anti-Virus (Security)***
#choco install malwarebytes -y

#***IT-Tools***
#choco install putty.install -y
#choco install sysinternals -y
#choco install ccleaner -y
#choco install virtualbox -y
#choco install wireshark -y
#choco install vscode.install -y
