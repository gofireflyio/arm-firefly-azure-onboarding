# Firefly Azure Integration ARM Templates

<p align="center">
  <img src="https://img.shields.io/badge/Azure-0078D4?style=for-the-badge&logo=microsoft-azure&logoColor=white" alt="Azure">
  <img src="https://img.shields.io/badge/ARM_Templates-FF6F00?style=for-the-badge&logo=microsoft&logoColor=white" alt="ARM Templates">
  <img src="https://img.shields.io/badge/Firefly-4B0082?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTEyIDJDNi40OCAyIDIgNi40OCAyIDEyUzYuNDggMjIgMTIgMjJTMjIgMTcuNTIgMjIgMTJTMTcuNTIgMiAxMiAyWiIgZmlsbD0iIzRCMDA4MiIvPgo8L3N2Zz4=" alt="Firefly">
</p>

## 🚀 Overview

This repository contains Azure Resource Manager (ARM) templates for seamlessly integrating your Azure subscriptions with Firefly's cloud asset management platform. Firefly helps you discover, manage, and codify your cloud infrastructure across multiple cloud providers.

## ✨ Features

### 🔧 Two Deployment Options

1. **Subscription-Level Deployment**
   - Onboard individual or multiple Azure subscriptions
   - Ideal for smaller organizations or specific subscription management
   - Simplified setup process

2. **Management Group-Level Deployment**
   - Onboard entire management group hierarchies
   - Automatically discovers and integrates all subscriptions under a management group
   - Includes event-driven monitoring capabilities
   - Perfect for enterprise-scale deployments

### 🛡️ Security & Permissions

The templates automatically configure the following Azure RBAC roles for the Firefly service principal:
- **Reader**: Read-only access to Azure resources
- **Billing Reader**: Access to billing and cost information
- **App Configuration Data Reader**: Read access to App Configuration data
- **Security Reader**: Read access to security recommendations and alerts
- **Monitoring Reader** (Management Group only): Access to monitoring data

### 🎯 Key Capabilities

- **Automated Service Principal Creation**: Guided process for creating and configuring Azure AD service principals
- **Bulk Subscription Onboarding**: Onboard multiple subscriptions in a single deployment
- **Custom Integration Naming**: Flexible naming patterns for your integrations
- **Event-Driven Monitoring** (Management Group only): Real-time tracking of Azure resource changes
- **Diagnostic Settings Configuration**: Automatic setup of Azure diagnostic logs
- **Storage Account Integration**: Centralized storage for monitoring data

## 📋 Prerequisites

Before deploying, ensure you have:

1. **Azure Permissions**:
   - Contributor or Owner role on the target subscription(s) or management group
   - Permission to create service principals in Azure AD
   - Permission to assign RBAC roles

2. **Firefly Account**:
   - Active Firefly account
   - Firefly Access Key and Secret Key (available from your Firefly dashboard)

3. **Azure Resources**:
   - For Management Group deployment: An existing resource group in a subscription for deployment resources

## 🚀 Quick Start

### Option 1: Subscription-Level Deployment

Deploy directly to Azure using the button below:

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fgofireflyio%2Farm-firefly-azure-onboarding%2Frefs%2Fheads%2FINFL-0406251%2Fazurefireflydeploy.json/createUIDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2Fgofireflyio%2Farm-firefly-azure-onboarding%2Frefs%2Fheads%2FINFL-0406251%2FCreateUIDefinition.json)

### Option 2: Management Group-Level Deployment

For enterprise-scale deployments across management groups:

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fgofireflyio%2Farm-firefly-azure-onboarding%2Frefs%2Fheads%2Fmain%2Fazurefireflydeploy-managementgroups.json/createUIDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2Fgofireflyio%2Farm-firefly-azure-onboarding%2Frefs%2Fheads%2Fmain%2FCreateUIDefinition-managementgroups.json)

## 📝 Deployment Steps

### 1. Service Principal Setup

During deployment, you'll need to create a service principal:

1. Click **"Create new"** in the Service Principal section
2. Name it (e.g., "Firefly-Integration")
3. Select account type (single or multi-tenant)
4. Click **"Register"**
5. Create a client secret and **copy the value immediately**
6. Return to the deployment template and paste the client secret

### 2. Configuration Parameters

#### Common Parameters:
- **Directory Domain**: Your organization's Azure AD domain (e.g., yourcompany.com)
- **Integration Name Pattern**: Naming template for integrations (supports `{subscriptionId}` placeholder)
- **Firefly Access Key**: Your Firefly API access key
- **Firefly Secret Key**: Your Firefly API secret key
- **Event-Driven Monitoring**: Enable real-time resource change tracking
- **Storage Account Name**: Name for the monitoring storage account
- **Webhook URL**: Firefly webhook endpoint (default provided)

### 3. Post-Deployment

After successful deployment:
1. Verify the integration in your Firefly dashboard
2. Check that all selected subscriptions appear
3. Review the discovered resources
4. Configure any additional Firefly policies or rules

## 🏗️ Architecture

### Subscription-Level Architecture
```
Azure Subscription(s)
    ├── Service Principal (with RBAC roles)
    └── Deployment Script (creates Firefly integration)
    ├── Storage Account (for monitoring data)
    ├── Event Grid Topic (for real-time events)
    ├── Logic App (for subscription monitoring)
    └── Diagnostic Settings (on each subscription)
```

### Management Group Architecture
```
Management Group
    ├── Service Principal (with RBAC roles)
    ├── All Child Subscriptions (auto-discovered)
    ├── Storage Account (for monitoring data)
    ├── Event Grid Topic (for real-time events)
    ├── Logic App (for subscription monitoring)
    └── Diagnostic Settings (on each subscription)
```

## 🔧 Advanced Configuration

### Custom Integration Names

Use the `integrationNamePattern` parameter with placeholders:
- `{subscriptionId}` - Replaced with the actual subscription ID
- Example: `MyCompany-Prod-{subscriptionId}` → `MyCompany-Prod-12345678-1234-1234-1234-123456789012`

### Event-Driven Monitoring (Management Group Only)

When enabled, provides:
- Real-time Azure resource change notifications
- Automatic diagnostic log collection
- Subscription addition/removal monitoring
- Centralized event storage

## 🐛 Troubleshooting

### Common Issues

1. **"Service Principal creation failed"**
   - Ensure you have permission to create app registrations in Azure AD
   - Verify the client secret was copied correctly

2. **"Role assignment failed"**
   - Check you have Owner or User Access Administrator role
   - Verify the service principal was created successfully

3. **"Integration creation failed"**
   - Verify Firefly credentials are correct
   - Ensure your Firefly account is active
   - Check network connectivity to Firefly API endpoints

### Validation

To verify successful deployment:

```powershell
# Check service principal
az ad sp show --id <service-principal-client-id>

# List role assignments
az role assignment list --assignee <service-principal-object-id>

# For management group deployment, check diagnostic settings
az monitor diagnostic-settings subscription list --subscription <subscription-id>
```

## 📊 Monitoring & Logs

### Deployment Logs
- Check Azure Portal → Deployments for detailed logs
- Deployment scripts retain logs for 1 hour post-execution

### Integration Status
- Monitor integration health in Firefly dashboard
- Check discovered resources and sync status

## 🔐 Security Best Practices

1. **Service Principal Management**:
   - Rotate client secrets regularly
   - Use managed identities where possible
   - Apply principle of least privilege

2. **Access Control**:
   - Limit who can modify the service principal
   - Review RBAC assignments periodically
   - Enable Azure AD conditional access

3. **Monitoring**:
   - Enable Azure Activity Log alerts
   - Monitor service principal sign-in logs
   - Set up Firefly alerts for integration issues

## 📚 Additional Resources

- [Firefly Documentation](https://docs.firefly.ai)
- [Azure ARM Template Reference](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure RBAC Documentation](https://docs.microsoft.com/en-us/azure/role-based-access-control/)

## 🤝 Support

For issues or questions:
- 📧 Email: support@firefly.ai
- 🐛 Issues: [GitHub Issues](https://github.com/gofireflyio/arm-firefly-azure-onboarding/issues)

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

<p align="center">
  Made with ❤️ by the Firefly Team
</p>
