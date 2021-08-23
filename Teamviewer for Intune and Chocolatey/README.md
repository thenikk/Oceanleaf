# TeamViewer + Chocolatey, a modern attempt for enterprise remote assistance - automation

More information on my blog: https://oceanleaf.ch/native-automated-teamviewer-for-intune/

The install_and_configure script does following steps for you:
* Uninstall previous TeamViewer MSI versions
* Installs [TeamViewer Host through Chocolatey](https://community.chocolatey.org/packages/teamviewer.host) (you can define if you want to install Chocolatey in the script)
* Configures TeamViewer with the unique *config id* and *ApiToken*
* (additionally can install a Chocolatey package that will update TeamViewer every day. Obviously only if there are new versions available.)


## Variables to adjust
Please make sure that you personalize following inputs for the script:
![adjustments-teamviewer](https://oceanleaf.ch/content/images/2021/06/adjustments-teamviewer.png)

You can find these values here:

1. Login to [TeamViewer admin deploy](https://login.teamviewer.com/nav/deploy) with your corporate account
2. Move to design and deploy, then click "add personalized module", and choose "Host"
![design_and_deploy_create](https://oceanleaf.ch/content/images/2021/06/design_and_deploy_create.png)

3. Customize your host
![design_and_deploy_config](https://oceanleaf.ch/content/images/2021/06/design_and_deploy_config.png)

4. After you click finish, you will get your *config id* and *ApiToken*
![variable_teamviewer](https://oceanleaf.ch/content/images/2021/06/variable_teamviewer.png)
