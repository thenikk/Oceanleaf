# Intune Change Tracking (Azure Workbook)

This Azure Workbook enables organizations to **monitor and track configuration changes** in Microsoft Intune, based on audit logs sent to a Log Analytics Workspace. It gives a comprehensive view of change activity over time and helps identify administrative actions, profile updates, app deployments, and other policy-related operations.

---

## ✨ Features

- 🔍 **Real-time visibility** into Intune audit log events  
- 🧭 **Breakdown by object type**: apps, scripts, configuration profiles, compliance, remediation, and more  
- 🛠️ **Method insights**: Create, Delete, Patch, Assign – all summarized and visualized  
- 📅 **Time-range filtering** with full control via dynamic parameters  
- 📊 **Audit event grouping** by identity, method, operation, and device context  
- 💡 Supports detection of **anomalous or unexpected changes**  

---

## 📦 Requirements

To use this workbook, ensure the following:

- Microsoft Intune audit logs are configured to send to **Azure Log Analytics**  
- Diagnostics settings
- Table required: `AuditLogs`

---

## 📂 Workbook Sections

- **Overview** – Key audit insights grouped by object type and method  
- **Search Profile Types** – Track specific profile-related changes  
- **Device Identity** – Track Autopilot Identities and changes
- **Device Operations** – Operational insights related to endpoints  
- **Environment Overview** – General Intune activity overview  
- **Cloud PC** – Audit log integration with Cloud PC context (if applicable)

---

## 🚀 Getting Started

1. Clone this repository or copy the workbook JSON
2. Open **Log Analytics Workspace -> Monitor -> Workbooks**, open the json editor view (</>) and paste the JSON file content
4. Adjust parameters to explore the data dynamically.


