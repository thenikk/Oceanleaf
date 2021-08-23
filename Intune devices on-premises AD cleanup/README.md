# Intune devices on-premises AD cleanup

Visit my [blog post](https://oceanleaf.ch/intune-devices-on-premises-ad-cleanup/) for a full documentation.

This script will query your Intune tenant, as well as your local Active Directory, where Intune devices are stored. Subsequently all records of computers that are only existing in AD, but not in Intune, will be listed and can be deleted. This will clean up your AD from legacy or decomissioned computers. Please make sure that you run this script with access to Active Directory and use an account for Microsoft online authentication, that is permitted to use Intune Graph to get device information.

**Run the script at your own responsibility. It is meant to do the best, but without any warranty. (Make sure you have a backup or the AD recycle bin enabled for emergency.)**

