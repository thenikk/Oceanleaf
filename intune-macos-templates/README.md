# Intune macOS Templates

Baseline policies to manage Macs with Microsoft Intune. A starting point for your own tenant, not a finished configuration.

| File | Type | What it does |
|---|---|---|
| `SettingsCatalog-PlatformSSO.json` | Settings Catalog | Platform SSO with Microsoft Entra ID |
| `SettingsCatalog-BasicSecurityHardening.json` | Settings Catalog | Basic hardening: auto logout, iCloud services, AirDrop and other restrictions |
| `SettingsCatalog-Edge.json` | Settings Catalog | Microsoft Edge: sign-in, sync, search provider, start pages (sample values, adjust) |
| `SettingsCatalog-MicrosoftAutoUpdate.json` | Settings Catalog | Microsoft AutoUpdate: channel, update checks, deadline |
| `Custom-MDEOnboardingSettings.json` | Custom profile | Microsoft Defender for Endpoint system settings ([source](https://github.com/microsoft/mdatp-xplat/tree/master/macos/mobileconfig/combined)) |
| `Compliance-Default.json` | Compliance | Default compliance policy for macOS |

## Import

- **Settings Catalog:** Intune admin center → Devices → Configuration → Create → Import policy
- **Custom and compliance:** import with [IntuneManagement](https://github.com/Micke-K/IntuneManagement)

Review every setting before you assign it, and test with a pilot group first.

Full walkthrough on the [Oceanleaf Blog](https://blog.oceanleaf.ch/kickstart-macos-management/).
