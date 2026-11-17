# Intune macOS Templates

A baseline for managed Macs in Microsoft Intune: 18 profiles for compliance, protection, Defender, Microsoft apps, updates, single sign-on and Global Secure Access. macOS 14 and later, Graph JSON, no assignments and no tenant data.

| Area | Profiles |
|---|---|
| Compliance | `Compliance-Default`: password, macOS 14+, SIP, disk encryption, Gatekeeper, firewall |
| Protect | FileVault with key escrow, firewall, basic hardening (inspired by [hmaslowski.com](https://hmaslowski.com/f/macos-security-hardening-with-microsoft-intune)) |
| Detect | Defender onboarding and settings ([mdatp-xplat](https://github.com/microsoft/mdatp-xplat/tree/master/macos/mobileconfig/combined)), custom attributes for Defender, Gatekeeper and battery cycles |
| Apps and updates | Edge, OneDrive, Microsoft AutoUpdate, macOS updates via DDM |
| Identity and access | Platform SSO, Global Secure Access extension and proxy. Optional: Enterprise SSO plug-in if you do not use Platform SSO |

## Use it

1. In `Custom-MDEOnboarding`, replace `REPLACE-WITH-ORGID` and `REPLACE-WITH-ONBOARDINGINFO` with your Defender onboarding package. Never commit the real values
2. Check the example values (Edge, OneDrive, update deferrals, login window text)
3. Import with a Graph tool such as [IntuneManagement](https://github.com/Micke-K/IntuneManagement)
4. Assign to a pilot group first, then widen

Files are UTF-8 without BOM. Read each profile before you assign it, provided as is under the [MIT License](../../LICENSE).
