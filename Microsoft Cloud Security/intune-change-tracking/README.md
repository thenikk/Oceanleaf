# Intune Change Tracking

See who changed what in Intune, and when. Audit events by profile type, method, device identity and Cloud PC, with a search by correlation ID that shows the changed values.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fthenikk%2FOceanleaf%2Fmain%2FMicrosoft%2520Cloud%2520Security%2Fintune-change-tracking%2Fazuredeploy.json)

| | |
|---|---|
| Version | 4.0 |
| Tables | `IntuneAuditLogs`, `IntuneDevices`, `Windows365AuditLogs` (optional) |
| Logs | Intune admin center → Tenant administration → Diagnostic settings: send **AuditLogs** and **Devices** to a Log Analytics workspace. |
| Roles | Log Analytics Reader on the workspace, Workbook Contributor to save it. |

## Highlights

- **Briefing and next steps:** what changed, compared to the previous period, and what to look at first
- **Unusual days:** daily changes against the expected range (`series_decompose_anomalies`), spikes flagged in red
- **What changed:** click an event and see every setting, old value in red, new value in green
- **Who changed:** admins and automation apps side by side, partner admins (GDAP) marked, new actors compared to the 90 days before
- **Open in Intune:** devices, apps and Settings Catalog policies link straight into the Intune admin center

## Install

**Deploy to Azure:** use the button above, pick the resource group of your workspace and paste the workspace resource ID into *Workbook Source Id*. The workbook appears under the workspace → Workbooks.

**Manual:** Azure Monitor → Workbooks → New → Advanced Editor (`</>`), paste [`intune-change-tracking.workbook`](intune-change-tracking.workbook), apply and save.

Choose the workspace in the **Workspace** parameter at the top.

## Tabs

- Overview: briefing with trend vs. previous period, changes by method and area, change pulse, latest changes
- Who changed: most active admins and apps (incl. partner admins via GDAP), risky changes such as deletions, wipes and role changes
- Profiles and apps: changes per profile type, top modified, search by name
- Device identity: Windows Autopilot hardware hash uploads, updates and deletions
- Device actions: remote actions over time, history per device
- Environment: compliance, OS, ownership, join type, encryption and more, one row per device
- Cloud PC: Windows 365 sizes and audit events

Click any event to see the changed settings with old and new value. **Privacy** turns people, devices and serial numbers into pseudonyms for demos and screenshots, **Theme** switches the panels between dark and light.

Full walkthrough on the [Oceanleaf Blog](https://blog.oceanleaf.ch/intune-change-tracking/).

## Notes

- Read-only: the workbook only runs KQL queries, it changes nothing in your tenant
- Provided as is, under the [MIT License](../../LICENSE)
