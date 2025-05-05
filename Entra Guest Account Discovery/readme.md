# Entra ID Guest Account Discovery (Azure Workbook)

This Azure Workbook helps organizations monitor and investigate **guest user activity** in Microsoft Entra ID.  
It provides a centralized, interactive view into guest sign-ins, tenant origins, and account lifecycle status – ideal for security, compliance, and identity governance teams.

---

## ✨ Features

- 📊 **Real-time visibility** into guest sign-in activity across your environment  
- 🔍 **Flexible log analysis** powered by workbook parameters (e.g. time range)  
- 🏷️ **Tenant ID to domain resolution** for clearer guest origin identification  
- 🧭 **Advanced filtering and search tools** for guest account investigations  
- 🚨 **Detection of stale or inactive guest accounts** for improved security posture  
- 🔒 Supports **risk detection**, **access reviews**, and **identity hygiene**

---

## 📂 Workbook Sections

- **Overview** – General insights and visualizations for guest sign-ins  
- **Origin Tenant Lookup** – Maps guest accounts to their home Tenants (domain resolution)  
- **Search** – Allows detailed lookup and filtering of guest sign-in events  
- **Stale Guest Account Discovery** – Highlights inactive or aging guest accounts for clean-up

---

## 📦 Requirements

- **Log Analytics Workspace** connected to your Entra ID
- Enabled **Sign-in Logs** diagnostic setting
- Required table: `SigninLogs`

---

1. Clone this repository or copy the workbook JSON
2. Open **Log Analytics Workspace -> Monitor -> Workbooks**, open the json editor view (</>) and paste the JSON file content
4. Adjust parameters to explore the data dynamically.
