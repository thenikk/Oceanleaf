# Global Secure Access Dashboard (Azure Workbook)

This Azure Workbook provides a unified monitoring experience for Global Secure Access (GSA) traffic across multiple channels:

- **Private Access**
- **Internet**
- **Microsoft 365 (M365)**

It enables IT and security teams to monitor, analyze, and gain visibility into organizational network traffic with rich contextual insights.

---

## ✨ Features

- 📊 **Interactive visualizations** of traffic by source, destination, and protocol  
- 🌐 **Channel-specific insights** for Private, Internet, and M365 traffic flows  
- 📈 **Real-time monitoring** of usage volume, trends, and activity patterns  
- 🔍 **Detailed traffic statistics** including sent/received bytes, top destinations, and user activity  
- 🧩 **Source-origin correlation** to identify high-impact devices or users  
- 🚦 **Action and policy analysis** for deeper investigation and filtering

---

## 📦 Requirements

To use this workbook, ensure the following:

- Azure **Log Analytics Workspace** connected to Entra Diagnostics - Global Secure Access diagnostics
- Required tables: `NetworkAccessTraffic`

---

## 📂 Workbook Sections

- **Overview** – General traffic summaries across GSA channels  
- **Channel Breakdown** – Per-channel views (Private, Internet, M365) with top destinations, ports, users  
- **Source Insights** – Active users, devices, IPs, and their traffic contributions  
- **Destination Analytics** – FQDN/IP breakdowns with traffic volume  
- **Traffic Statistics** – Sent/received GBs, protocol usage, and action types  

---

## 🚀 Getting Started

1. Clone this repository or copy the workbook JSON
2. Open **Log Analytics Workspace -> Monitor -> Workbooks**, open the json editor view (</>) and paste the JSON file content
4. Adjust parameters (e.g. channel, action) to explore the data dynamically.



