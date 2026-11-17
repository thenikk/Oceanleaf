# Intune Change Tracking

Who changed what in Intune, and when, with the changed values for every event.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fthenikk%2FOceanleaf%2Fmain%2FMicrosoft%2520Cloud%2520Security%2Fintune-change-tracking%2Fazuredeploy.json)

| | |
|---|---|
| Tables | `IntuneAuditLogs`, `IntuneDevices`, `Windows365AuditLogs` (optional), via Intune → Tenant administration → Diagnostic settings |
| Roles | Log Analytics Reader, Workbook Contributor to save |

- **Briefing and next steps:** what changed vs. the previous period and what to look at first
- **Change calendar:** changes per day, days with risky changes outlined in red
- **Leaderboard:** admins and apps by changes, risky share and off-hours work, partner admins (GDAP) marked
- **What changed:** click an event, old value in red, new value in green, links straight into Intune
- **Tabs:** Overview, Who changed, Profiles and apps, Device identity, Device actions, Environment, Cloud PC

**Privacy** turns people and devices into pseudonyms, **Theme** switches dark and light. Walkthrough on the [blog](https://blog.oceanleaf.ch/intune-change-tracking/).

## Install

Use the button, pick the resource group of your workspace and paste its resource ID into *Workbook Source Id*. Or: Azure Monitor → Workbooks → New → Advanced Editor (`</>`), paste [`intune-change-tracking.workbook`](intune-change-tracking.workbook), apply and save.

Read-only, provided as is under the [MIT License](../../LICENSE).
