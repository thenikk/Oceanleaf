# Global Secure Access Dashboard

Global Secure Access traffic across Internet, Private, Entra and Microsoft 365: volume, destinations, sources, clients and blocks.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fthenikk%2FOceanleaf%2Fmain%2FMicrosoft%2520Cloud%2520Security%2Fgsa-unified-dashboard%2Fazuredeploy.json)

| | |
|---|---|
| Tables | `NetworkAccessTraffic` (Entra → Global Secure Access → Settings → Logging) |
| Roles | Log Analytics Reader, Workbook Contributor to save |

- **Briefing and next steps:** blocks, threats, TLS inspection and client updates in plain language
- **Pulse and channels:** traffic heatmap by weekday and hour, channel and block rings
- **Traffic radar:** top destinations, blocked ones in red
- **Silent clients and client currency:** devices that stopped sending traffic or run an old client
- **Tabs:** Overview, Destinations, Private Access, Sources and clients, Blocks and policies. **Channel** and **Action** filter everything

AI apps and prompts from the same logs: [AI Command Center](https://oceanleaf.ch/ai-command-center). Walkthrough on the [blog](https://blog.oceanleaf.ch/gsa-logs/).

## Install

Use the button, pick the resource group of your workspace and paste its resource ID into *Workbook Source Id*. Or: Azure Monitor → Workbooks → New → Advanced Editor (`</>`), paste [`gsa-unified-dashboard.workbook`](gsa-unified-dashboard.workbook), apply and save.

Read-only, provided as is under the [MIT License](../../LICENSE).
