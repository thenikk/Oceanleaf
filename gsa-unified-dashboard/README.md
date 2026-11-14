# Global Secure Access Dashboard

One view on Global Secure Access traffic across Internet Access, Private Access and Microsoft 365: volume, destinations, sources, client versions and blocks.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fthenikk%2FOceanleaf%2Fmain%2Fgsa-unified-dashboard%2Fazuredeploy.json)

| | |
|---|---|
| Version | 2.0 |
| Tables | `NetworkAccessTraffic` |
| Logs | Entra admin center → Global Secure Access → Settings → Logging: send **NetworkAccessTrafficLogs** to a Log Analytics workspace. |
| Roles | Log Analytics Reader on the workspace, Workbook Contributor to save it. |

## Highlights

- **Briefing and next steps:** blocks, threats, TLS inspection coverage and client updates, in plain language
- **Unusual days:** daily connections against the expected range, spikes flagged in red
- **Silent clients:** devices that stopped sending traffic, a hint that the client stopped or was bypassed
- **Client currency:** latest client version per OS seen in your tenant and the devices behind it
- **New destinations:** FQDNs first seen in this period compared to the 30 days before

## Install

**Deploy to Azure:** use the button above, pick the resource group of your workspace and paste the workspace resource ID into *Workbook Source Id*. The workbook appears under the workspace → Workbooks.

**Manual:** Azure Monitor → Workbooks → New → Advanced Editor (`</>`), paste [`gsa-unified-dashboard.workbook`](gsa-unified-dashboard.workbook), apply and save.

Choose the workspace in the **Workspace** parameter at the top.

## Tabs

- Overview: briefing, connections, users, devices and traffic with trend, activity per day, channel split
- Destinations: cloud apps and web categories, app scores, top FQDNs, IPs and ports
- Private Access: destination IPs, connectors, app IDs and processing regions
- Sources and clients: operating systems, client versions with devices on an older client, protocols, processes, source IPs and users
- Blocks and policies: blocks per policy and rule, top blocked destinations and users, threat detections, TLS inspection share

**Channel** and **Action** filter the whole dashboard. AI apps, prompts and MCP traffic from the same logs are covered by the [AI Command Center](https://oceanleaf.ch/ai-command-center).

Full walkthrough on the [Oceanleaf Blog](https://blog.oceanleaf.ch/gsa-logs/).

## Notes

- Read-only: the workbook only runs KQL queries, it changes nothing in your tenant
- Provided as is, under the [MIT License](../LICENSE)
