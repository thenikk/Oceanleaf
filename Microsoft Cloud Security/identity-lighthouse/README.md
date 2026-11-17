# Identity Lighthouse

One workbook that lights up the identity side of Microsoft Entra: where sign-ins come from, who is at risk, what changed in the directory and which workload identities act without a person.

[![Identity Lighthouse preview with demo data](assets/preview.svg)](assets/preview.svg)

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fthenikk%2FOceanleaf%2Fmain%2FMicrosoft%2520Cloud%2520Security%2Fidentity-lighthouse%2Fazuredeploy.json)

| | |
|---|---|
| Version | 1.0 |
| Tables | `SigninLogs`, `AuditLogs`. Optional: `AADRiskyUsers`, `AADUserRiskEvents`, `AADServicePrincipalSignInLogs`, `AADManagedIdentitySignInLogs` |
| Logs | Entra admin center → Monitoring & health → Diagnostic settings: send the log categories above to a Log Analytics workspace. |
| Roles | Log Analytics Reader on the workspace, Workbook Contributor to save it. |

The preview shows demo data, not a real tenant.

## What you see

- **Sign-in radar:** a dot-matrix world map. Every origin is a glowing dot, sized by sign-ins and red when it has failures. Routes lead to your main origin, a lighthouse beam sweeps around it
- **Briefing and next steps:** users, failure rate, single factor sign-ins, legacy authentication, role assignments and risky users, in plain language
- **Unusual days:** sign-ins against the expected range, spikes flagged in red
- **Outcome model:** success, interrupted (MFA or consent required) and failure are kept apart, so MFA prompts do not inflate the failure rate
- **Hunting:** password spray, brute force followed by success, impossible travel, first sign-in from a new country, MFA fatigue, security info changes
- **Privacy mode:** users, actors, IP addresses and tenants become pseudonyms, display only

## Install

**Deploy to Azure:** use the button above, pick the resource group of your workspace and paste the workspace resource ID into *Workbook Source Id*. The workbook appears under the workspace → Workbooks.

**Manual:** Azure Monitor → Workbooks → New → Advanced Editor (`</>`), paste [`identity-lighthouse.workbook`](identity-lighthouse.workbook), apply and save.

Choose the workspace in the **Workspace** parameter at the top. Dark and light theme are a parameter too.

## Tabs

| Tab | Content |
|---|---|
| Overview | Briefing, next steps, sign-in radar, activity, outcome, hours, top users and apps, directory changes |
| Identity risk | Risky users, detections and risky sign-ins from Entra ID Protection |
| Hunting | Detections with thresholds you can tune in the queries |
| MFA and access | Authentication strength, Conditional Access results and gaps, clients and devices |
| Privileged changes | Role assignments, PIM, policy changes, user lifecycle |
| Apps | Service principals, managed identities, consents and credential changes, new applications |
| Locations and devices | Map, countries, cities, networks, source IPs, join type and compliance |
| Guests | Risk, invitations, home tenants and inactive guests |
| User lookup | One user across sign-ins and directory changes |

## Notes

- Read-only: the workbook only runs KQL queries, it changes nothing in your tenant
- Identity risk and Apps need their optional tables. Without them the matching items show a query error, the other tabs keep working
- The radar uses the sign-in coordinates from the logs, rounded to one degree. Sign-ins without coordinates are not on the map
- This workbook shows personal data about your users. Check your internal rules and the Swiss FADP before you share access
- Provided as is, under the [MIT License](../../LICENSE)
