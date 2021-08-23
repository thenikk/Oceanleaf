# Upload hardware hash to Intune tenant, made easy
This script was made as an addition to "Get-WindowsAutoPilotInfo" for registering the individual hardware hash id 
from a device into a Microsoft 365 Intune tenant, for device enrollment to be **super simple & reusable**. 
You can find the page with all already uploaded hashes under: https://endpoint.microsoft.com/ Devices > Enroll devices > Devices.

**Detailed info in [my blog](https://oceanleaf.ch/upload-hardware-hash-to-intune-made-easy)**

## How to use it

 1. Windows OOBE, press shift + f10 to start CMD
 2. Start script with "*path*/start" (for example d:/start)
 3. If there is no config.txt file in same directory, you will be querried for information, please follow the instructions and enter the information you want to have (can be left blank, if you dont need it)

![enter image description here](https://oceanleaf.ch/content/images/2021/02/flow-1.gif)

Please feel free to leave me some feedback, or improvements you want to have. Everything is greatly appreciated. This is my first "real" script so I'm excited to hear what you think.  
Special thanks to Joshua, for helping me out with scripting ;)

*Script is using the following subscripts, content or resources:
https://www.powershellgallery.com/packages/Get-WindowsAutoPilotInfo/3.5 by Michael Niehaus
https://www.powershellgallery.com/packages/Get-AutopilotDiagnostics/5.6 by Michael Niehaus*


