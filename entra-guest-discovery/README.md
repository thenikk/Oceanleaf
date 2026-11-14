# Entra Guest Discovery

Know your guests. Where they come from, what they use, who signs in without MFA and who never accepted the invitation.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fthenikk%2FOceanleaf%2Fmain%2Fentra-guest-discovery%2Fazuredeploy.json)

| | |
|---|---|
| Version | 2.0 |
| Tables | `SigninLogs`, `AuditLogs` |
| Logs | Entra admin center → Monitoring & health → Diagnostic settings: send **SignInLogs** and **AuditLogs** to a Log Analytics workspace. |
| Roles | Log Analytics Reader on the workspace, Workbook Contributor to save it. |

## Highlights

- **Briefing and next steps:** guests without MFA, unused invitations, new organisations, in plain language
- **Organisation cards:** every guest organisation with logo, guests, sign-ins and MFA coverage (logos can be turned off)
- **Unusual days:** guest sign-ins against the expected range, spikes flagged in red
- **Risk score:** each guest ranked by missing MFA, risk, private mail address and missing Conditional Access
- **Open in Entra:** jump from a guest straight to the user in the Entra admin center

## Install

**Deploy to Azure:** use the button above, pick the resource group of your workspace and paste the workspace resource ID into *Workbook Source Id*. The workbook appears under the workspace → Workbooks.

**Manual:** Azure Monitor → Workbooks → New → Advanced Editor (`</>`), paste [`entra-guest-discovery.workbook`](entra-guest-discovery.workbook), apply and save.

Choose the workspace in the **Workspace** parameter at the top.

## Tabs

- Overview: briefing with trend vs. previous period, guests and sign-ins per day, top organisations, sign-in map, apps, failed sign-ins
- Risk: guests without MFA, with a private mail address, with risky sign-ins or without Conditional Access, ranked by score
- Invitations: funnel from invited to signed in, invitations never used, who invites
- Home tenants: guest organisations with tenant name, click a row to look a tenant up
- Search: sign-ins and failures per guest and app
- Inactive guests: guests without a sign-in since a chosen period

**Privacy** turns guests, admins, organisations and tenants into pseudonyms for demos and screenshots, **Theme** switches the panels between dark and light.

Full walkthrough on the [Oceanleaf Blog](https://blog.oceanleaf.ch/entra-b2b-external-id-discovery/).

## Notes

- Read-only: the workbook only runs KQL queries, it changes nothing in your tenant
- Provided as is, under the [MIT License](../LICENSE)
