# Firefly Azure Integration ARM Templates

<p align="center">
  <img src="https://img.shields.io/badge/Azure-0078D4?style=for-the-badge&logo=microsoft-azure&logoColor=white" alt="Azure">
  <img src="https://img.shields.io/badge/ARM_Templates-FF6F00?style=for-the-badge&logo=microsoft&logoColor=white" alt="ARM Templates">
  <img src="https://img.shields.io/badge/Firefly-4B0082?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTEyIDJDNi40OCAyIDIgNi40OCAyIDEyUzYuNDggMjIgMTIgMjJTMjIgMTcuNTIgMjIgMTJTMTcuNTIgMiAxMiAyWiIgZmlsbD0iIzRCMDA4MiIvPgo8L3N2Zz4=" alt="Firefly">
  <img src="https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white" alt="PowerShell">
</p>

<p align="center">
  <img src="firefly.gif" alt="Firefly Logo">
</p>

## 🚀 Overview

**Firefly Azure Integration** provides enterprise-grade ARM templates for seamlessly connecting your Azure subscriptions with Firefly's cloud asset management and FinOps platform. These templates automate the complete setup process, from service principal creation to advanced monitoring infrastructure deployment.

### 🎯 What is Firefly?

Firefly is a comprehensive cloud asset management platform that helps organizations:
- **Discover & Inventory** all cloud resources across multiple providers
- **Optimize Costs** with intelligent recommendations and automated policies
- **Ensure Compliance** with security and governance standards
- **Manage Infrastructure as Code** with drift detection and remediation
- **Monitor Changes** in real-time with event-driven architecture

## ✨ Key Features & Capabilities

### 🔧 **Flexible Deployment Options**

#### 📊 **Single Subscription Deployment**
- Perfect for small to medium organizations
- Quick setup with minimal configuration
- Ideal for testing and proof-of-concept scenarios

#### 🏢 **Multi-Subscription Deployment**
- Enterprise-scale deployment across multiple subscriptions
- Centralized management with distributed monitoring
- Bulk onboarding with parallel processing

#### 🌐 **Management Group Deployment** *(Available separately)*
- Organization-wide deployment across entire management group hierarchies
- Automatic discovery of new subscriptions
- Enterprise governance and compliance at scale

### 🛡️ **Advanced Security & Permissions**

#### **Built-in Azure RBAC Roles**
- **Reader**: Read-only access to Azure resources
- **Billing Reader**: Access to cost and billing information
- **App Configuration Data Reader**: Configuration data access
- **Security Reader**: Security recommendations and alerts
- **Storage Blob Data Reader**: Conditional access to storage blobs

#### **Custom Role Definitions**
- **Firefly Custom Role**: Specialized permissions for:
  - Storage account key access
  - Database connection strings
  - Kubernetes cluster credentials
  - Web app configurations
  - Redis cache keys
  - Search service keys
  - Log Analytics workspace keys

#### **Conditional Access Policies**
- Terraform state file access (`*state`, `*.tfstateenv:*`)
- Restricted blob access with intelligent filtering
- Network-level security controls

### 🔄 **Event-Driven Monitoring** *(Optional)*

#### **Real-Time Infrastructure Tracking**
- **Azure Event Grid Integration**: Instant notifications for resource changes
- **Storage Account Monitoring**: Centralized log collection and analysis
- **Diagnostic Settings**: Automatic configuration across all subscriptions
- **Webhook Integration**: Direct integration with Firefly's event processing pipeline

#### **Monitoring Infrastructure**
- Dedicated storage accounts per subscription
- Event Grid system topics with custom filtering
- Automated diagnostic settings deployment
- Configurable retention and delivery policies

### 🏷️ **Resource Management & Tagging**

#### **Intelligent Tagging System**
- Custom tag support through editable grid interface
- Automatic `firefly: true` tag application
- Tag inheritance across all created resources
- Compliance and cost allocation support

#### **Resource Organization**
- Dedicated resource groups per subscription (`firefly-monitoring-{subscriptionId}`)
- Unique naming conventions to prevent conflicts
- Centralized resource lifecycle management

### 🌐 **Network Security & Access Control**

#### **Storage Network Rules** *(Optional)*
- Restrict access to predefined Firefly IP addresses
- Enhanced security for sensitive environments
- Configurable IP allowlists
- TLS 1.2+ enforcement

#### **Firefly IP Addresses** *(Pre-configured)*
```
3.224.145.192
54.83.245.177
34.226.97.113
54.146.252.237
3.213.167.195
54.166.221.160
52.22.128.83
52.86.171.233
34.200.154.87
100.25.162.125
18.209.82.232
98.83.246.85
54.144.58.153
```

### 🔧 **Advanced Configuration Options**

#### **Environment-Specific Settings**
- **Production/Non-Production** environment flags
- **Auto-Discovery** capabilities for new resources
- **Infrastructure as Code** detection and monitoring
- **Custom directory domain** configuration

#### **Integration Naming**
- **Automatic Subscription Name Detection**: Uses actual Azure subscription display names
- **Intelligent Fallback**: Uses subscription ID if name unavailable
- **Conflict Resolution**: Automatic handling of duplicate names

## 📋 Prerequisites

### **Azure Requirements**
- **Permissions**: Contributor or Owner role on target subscription(s)
- **Azure AD Rights**: Ability to create service principals and assign roles
- **Subscription Access**: Valid Azure subscription(s) to monitor

### **Firefly Requirements**
- **Active Firefly Account**: [Sign up here](https://firefly.ai)
- **API Credentials**: Access Key and Secret Key from Firefly dashboard
- **Webhook Access**: Firefly webhook endpoint accessibility

## 🚀 Quick Start

### **Option 1: Single/Multi-Subscription Deployment**

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fgofireflyio%2Farm-firefly-azure-onboarding%2Frefs%2Fheads%2Fmain%2Fazurefireflydeploy.json/createUIDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2Fgofireflyio%2Farm-firefly-azure-onboarding%2Frefs%2Fheads%2Fmain%2FCreateUIDefinition.json)

### **Option 2: Management Group Deployment**

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fgofireflyio%2Farm-firefly-azure-onboarding%2Frefs%2Fheads%2Fmain%2Fazurefireflydeploy-managementgroups.json/createUIDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2Fgofireflyio%2Farm-firefly-azure-onboarding%2Frefs%2Fheads%2Fmain%2FCreateUIDefinition-managementgroups.json)

### **Option 3: Azure Lighthouse Delegation** *(no service principal in your tenant)*

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fgofireflyio%2Farm-firefly-azure-onboarding%2Frefs%2Fheads%2Fmain%2Fazurefireflylighthouse.json/createUIDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2Fgofireflyio%2Farm-firefly-azure-onboarding%2Frefs%2Fheads%2Fmain%2FCreateUIDefinition-lighthouse.json)

For organizations whose policy forbids creating app registrations, service principals, or long-lived client secrets. Azure Lighthouse is Azure's equivalent of an AWS cross-account IAM role: Firefly's principals stay in Firefly's tenant and receive scoped Azure RBAC on your subscription. **Nothing is created in your directory and no credential is exchanged.**

```bash
az deployment sub create \
  --name firefly-lighthouse \
  --location <AzureRegion> \
  --template-file azurefireflylighthouse.json \
  --parameters azurefireflylighthouse.parameters.json
```

**Delegated roles**

| Role | Granted when | Purpose |
|---|---|---|
| Reader | always | Resource inventory; required for portal visibility |
| Billing Reader / Cost Management Reader | always | FinOps |
| Security Reader | always | Defender for Cloud findings |
| Monitoring Reader | always | Metrics and diagnostic settings read |
| Monitoring Contributor | `enableProvisioningAccess` | Write subscription diagnostic settings |
| EventGrid Contributor | `enableProvisioningAccess` | Create system topic + event subscription |
| Storage Account Contributor | `enableProvisioningAccess` | Create/manage the event storage account |
| User Access Administrator | `enableManagedIdentityRoleDelegation` | Restricted by `delegatedRoleDefinitionIds` to assigning Storage Blob Data Reader and Reader to **managed identities in your subscription only** |
| Managed Services Registration assignment Delete | `enableSelfServiceOffboarding` | Lets Firefly remove its own delegation |

**Prerequisites**

- Deploying account needs **Owner** on the target subscription (`Microsoft.Authorization/roleAssignments` read/write/delete).
- `Microsoft.ManagedServices` resource provider — registered automatically by the deployment.
- One deployment per subscription. Management groups cannot be delegated directly; use [Azure Policy to onboard each subscription in a management group](https://learn.microsoft.com/en-us/azure/lighthouse/how-to/onboard-management-group).
- `managedByTenantId` must differ from the tenant of the subscription being onboarded.

**Known limitations of this path**

Azure Lighthouse authorizations accept **built-in roles only** — no custom roles, and no role carrying `DataActions`. Consequences versus Option 1:

- The custom `Firefly-CustomRole` list-keys permissions (Cosmos DB, AKS, Redis, App Configuration, Search, Service Bus, Log Analytics shared keys) are **not** available. Where equivalent coverage is required, Storage Account Contributor covers storage keys only.
- Storage Blob Data Reader cannot be delegated to Firefly directly. Blob reads must run from an in-subscription managed identity — enable `enableManagedIdentityRoleDelegation` and deploy the in-tenant collector.
- App Configuration Data Reader (`DataActions`) is not available.
- Microsoft Entra directory objects are out of scope entirely — Lighthouse is Azure RBAC, not Microsoft Graph.

**Security notes for your review**

- Conditional Access policies in *your* tenant do not apply to delegated principals; identity controls (MFA, PIM) are enforced in Firefly's tenant. Your Azure Policy assignments and Azure RBAC still apply to every delegated operation, and all activity appears in your subscription's activity log.
- Storage Account Contributor includes `listKeys`. Clear `enableProvisioningAccess` if that is not acceptable.
- Review and revoke at any time: **Azure portal → Service providers → Service provider offers**.

**Offboarding**

```bash
az managedservices assignment list --query "[].{Name:name, Offer:properties.registrationDefinitionId}" -o table
az managedservices assignment delete --assignment <assignment-name>
az managedservices definition delete --definition <definition-name>
```

---

### **Offboarding (Azure CLI)**

To remove Firefly resources from your Azure subscription, run these commands:

```
# 1. List Firefly diagnostic settings
az monitor diagnostic-settings subscription list --query "[?contains(name, 'firefly')]"

# 2. Delete diagnostic settings (replace <name> with actual name from step 1)
az monitor diagnostic-settings subscription delete --name "<name>" --yes

# 3. List Firefly resource groups
az group list --query "[?contains(name, 'firefly')].{Name:name, Location:location}" -o table

# 4. Delete Firefly resource group (this deletes all resources inside)
az group delete --name "firefly-monitoring-<subscription-id>" --yes

# 5. List Firefly custom role definitions
az role definition list --custom-role-only --query "[?contains(roleName, 'Firefly')].{Name:roleName}" -o table

# 6. Delete Firefly custom role definition (replace <role-name> with actual name)
az role definition delete --name "<role-name>"
```

> **Note:** Remember to also remove the integration from the Firefly dashboard.

## 📝 Step-by-Step Deployment Guide

### **Step 1: Service Principal Setup**

The deployment wizard will guide you through creating a service principal:

1. **Click "Create new"** in the Service Principal section
2. **Name your application** (e.g., "Firefly-Integration")
3. **Select account type** (single or multi-tenant based on your needs)
4. **Click "Register"** to create the service principal
5. **Create a client secret**:
   - Click "+ New Client Secret"
   - Set expiration (recommend 24 months)
   - **Copy the secret value immediately** (it won't be shown again)
6. **Return to deployment** and paste the client secret

### **Step 2: Configuration Parameters**

#### **Integration Configuration**
- ✅ **Enable Event-Driven Monitoring**: Real-time resource change tracking
- ✅ **Production Environment**: Mark as production for enhanced monitoring
- ✅ **Multi-Subscription Deployment**: Monitor multiple subscriptions simultaneously
- ✅ **Enforce Storage Network Rules**: Restrict access to Firefly IPs only

#### **Firefly Credentials**
- **Access Key**: Your Firefly API access key
- **Secret Key**: Your Firefly API secret key

#### **Advanced Options**
- **Custom Tags**: Add organizational tags to all resources
- **Target Subscriptions**: Select additional subscriptions to monitor
- **Directory Domain**: Your organization's domain (defaults to firefly.ai)

### **Step 3: Review & Deploy**

1. **Review all settings** in the final step
2. **Accept terms and conditions**
3. **Click "Create"** to start deployment
4. **Monitor progress** in the Azure portal (typically 5-10 minutes)

### **Step 4: Post-Deployment Verification**

1. **Check Firefly Dashboard**: Verify new integration appears
2. **Validate Resource Discovery**: Confirm Azure resources are being discovered
3. **Test Event Monitoring**: Make a test change to verify real-time monitoring
4. **Review Permissions**: Ensure service principal has correct role assignments

## 🏗️ Architecture Overview

### **Single Subscription Architecture**
```
┌─────────────────────────────────────────────────────────────────┐
│                    Azure Subscription                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌─────────────────┐    ┌─────────────────────────────────────┐ │
│  │ Service         │    │ RBAC Roles                          │ │
│  │ Principal       │───▶│ • Reader                            │ │
│  │                 │    │ • Billing Reader                    │ │
│  └─────────────────┘    │ • Security Reader                   │ │
│                         │ • App Configuration Data Reader     │ │
│                         │ • Custom Firefly Role              │ │
│                         │ • Storage Blob Data Reader         │ │
│                         └─────────────────────────────────────┘ │
│                                                                 │
│  ┌─────────────────────────────────────────────────────────────┐ │
│  │ Monitoring Infrastructure (Optional)                        │ │
│  │ ┌─────────────┐ ┌─────────────┐ ┌─────────────────────────┐ │ │
│  │ │ Storage     │ │ Event Grid  │ │ Diagnostic Settings     │ │ │
│  │ │ Account     │ │ Topic       │ │ (Activity Logs)         │ │ │
│  │ └─────────────┘ └─────────────┘ └─────────────────────────┘ │ │
│  └─────────────────────────────────────────────────────────────┘ │
│                                │                                │
└────────────────────────────────┼────────────────────────────────┘
                                 │
                                 ▼
                    ┌─────────────────────────┐
                    │ Firefly Platform        │
                    │ • Resource Discovery    │
                    │ • Cost Optimization     │
                    │ • Security Monitoring   │
                    │ • Compliance Tracking   │
                    └─────────────────────────┘
```

### **Multi-Subscription Architecture**
```
┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│ Subscription 1  │  │ Subscription 2  │  │ Subscription N  │
│                 │  │                 │  │                 │
│ ┌─────────────┐ │  │ ┌─────────────┐ │  │ ┌─────────────┐ │
│ │Monitoring   │ │  │ │Monitoring   │ │  │ │Monitoring   │ │
│ │Infrastructure│ │  │ │Infrastructure│ │  │ │Infrastructure│ │
│ └─────────────┘ │  │ └─────────────┘ │  │ └─────────────┘ │
└─────────┬───────┘  └─────────┬───────┘  └─────────┬───────┘
          │                    │                    │
          └────────────────────┼────────────────────┘
                               │
                               ▼
                  ┌─────────────────────────┐
                  │ Shared Service Principal│
                  │ • Cross-subscription    │
                  │   RBAC assignments      │
                  │ • Centralized auth      │
                  └─────────────────────────┘
                               │
                               ▼
                  ┌─────────────────────────┐
                  │ Firefly Platform        │
                  │ ┌─────────────────────┐ │
                  │ │ Unified Dashboard   │ │
                  │ │ • All subscriptions │ │
                  │ │ • Cost analytics    │ │
                  │ │ • Security posture  │ │
                  │ │ • Compliance view   │ │
                  │ └─────────────────────┘ │
                  └─────────────────────────┘
```

## 🔧 Advanced Configuration

### **Custom Role Permissions**

The template creates custom roles with specific permissions:

```json
{
  "actions": [
    "Microsoft.Storage/storageAccounts/listkeys/action",
    "Microsoft.DocumentDB/databaseAccounts/listConnectionStrings/action",
    "Microsoft.ContainerService/managedClusters/listClusterUserCredential/action",
    "Microsoft.Web/sites/config/list/Action",
    "Microsoft.Cache/redis/listKeys/action",
    "Microsoft.AppConfiguration/configurationStores/ListKeys/action",
    "Microsoft.Search/searchServices/listQueryKeys/action",
    "Microsoft.OperationalInsights/workspaces/sharedkeys/action"
  ]
}
```

### **Event Grid Configuration**

Event subscriptions are configured with:
- **Event Types**: `Microsoft.Storage.BlobCreated`
- **Delivery**: Webhook to Firefly endpoint
- **Retry Policy**: 30 attempts over 24 hours
- **Batch Size**: Single events for real-time processing

### **Storage Account Security**

When network rules are enforced:
- **Default Action**: Deny all traffic
- **Allowed IPs**: Only Firefly IP addresses
- **TLS Version**: Minimum TLS 1.2
- **Public Access**: Controlled blob access only

## 🐛 Troubleshooting

### **Common Issues & Solutions**

#### **Service Principal Creation Failed**
```bash
# Check Azure AD permissions
az ad sp list --display-name "Firefly-Integration"

# Verify you have Application Administrator role
az role assignment list --assignee <your-user-id> --all
```

#### **Role Assignment Failed**
```bash
# Check subscription permissions
az role assignment list --scope "/subscriptions/<subscription-id>"

# Verify Owner or User Access Administrator role
az role definition list --name "Owner"
```

#### **Integration Creation Failed**
- ✅ Verify Firefly credentials are correct
- ✅ Check network connectivity to `https://prodapi.firefly.ai`
- ✅ Ensure service principal has required permissions
- ✅ Validate subscription ID format

#### **Event Monitoring Not Working**
```bash
# Check diagnostic settings
az monitor diagnostic-settings subscription list

# Verify storage account access
az storage account show --name <storage-account-name>

# Test event grid subscription
az eventgrid system-topic event-subscription list --system-topic-name <topic-name>
```

### **Validation Commands**

```powershell
# PowerShell validation script
$subscriptionId = "<your-subscription-id>"
$spObjectId = "<service-principal-object-id>"

# Check service principal
Get-AzADServicePrincipal -ObjectId $spObjectId

# List role assignments
Get-AzRoleAssignment -ObjectId $spObjectId -Scope "/subscriptions/$subscriptionId"

# Check storage account (if event-driven enabled)
Get-AzStorageAccount -ResourceGroupName "firefly-monitoring-$subscriptionId"

# Verify diagnostic settings
Get-AzDiagnosticSetting -ResourceId "/subscriptions/$subscriptionId"
```

## 📊 Monitoring & Observability

### **Deployment Monitoring**
- **Azure Portal**: Real-time deployment progress
- **Activity Log**: Detailed operation logs
- **Resource Health**: Post-deployment validation

### **Integration Health**
- **Firefly Dashboard**: Integration status and metrics
- **Resource Discovery**: Automated inventory updates
- **Cost Analytics**: Billing data synchronization
- **Security Posture**: Compliance and security insights

### **Event Monitoring** *(When Enabled)*
- **Real-time Events**: Resource creation, modification, deletion
- **Storage Metrics**: Log ingestion and processing rates
- **Webhook Delivery**: Success/failure rates and retry statistics
- **Diagnostic Logs**: Administrative activity tracking

## 🔐 Security Best Practices

### **Service Principal Management**
- 🔄 **Rotate secrets regularly** (every 12-24 months)
- 🔒 **Use certificate authentication** when possible
- 📝 **Document service principal usage** and ownership
- 🚫 **Avoid sharing credentials** across environments

### **Access Control**
- 👥 **Limit service principal editors** to security team
- 📋 **Regular access reviews** of role assignments
- 🔍 **Monitor sign-in logs** for unusual activity
- 🚨 **Set up alerts** for permission changes

### **Network Security**
- 🌐 **Enable storage network rules** for sensitive environments
- 🔐 **Use private endpoints** where applicable
- 📊 **Monitor network access patterns**
- 🛡️ **Implement conditional access policies**

### **Compliance & Governance**
- 📋 **Tag all resources** for cost allocation
- 📝 **Document integration purpose** and data flows
- 🔍 **Regular compliance audits** of permissions
- 📊 **Monitor resource usage** and costs

## 🤝 Support & Community

### **Getting Help**
- 📧 **Email Support**: [support@firefly.ai](mailto:support@firefly.ai)
- 🐛 **GitHub Issues**: [Report bugs and feature requests](https://github.com/gofireflyio/arm-firefly-azure-onboarding/issues)
- 📚 **Documentation**: [Firefly Knowledge Base](https://docs.firefly.ai)
- 💬 **Community**: [Firefly Community Forum](https://community.firefly.ai)

### **Contributing**
We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details on:
- 🐛 Bug reports and feature requests
- 🔧 Code contributions and improvements
- 📝 Documentation updates
- 🧪 Testing and validation

## 📚 Additional Resources

### **Firefly Platform**
- 🌐 [Firefly Website](https://firefly.ai)
- 📖 [Platform Documentation](https://docs.firefly.ai)
- 🎓 [Getting Started Guide](https://docs.firefly.ai/getting-started)
- 🎯 [Best Practices](https://docs.firefly.ai/best-practices)

### **Azure Resources**
- 📘 [ARM Template Documentation](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- 🔐 [Azure RBAC Guide](https://docs.microsoft.com/en-us/azure/role-based-access-control/)
- 🔧 [Service Principal Management](https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal)
- 📊 [Azure Monitor Documentation](https://docs.microsoft.com/en-us/azure/azure-monitor/)

### **Integration Examples**
- 🏢 [Enterprise Deployment Patterns](examples/enterprise/)
- 🔧 [Custom Role Definitions](examples/custom-roles/)
- 📊 [Monitoring Configurations](examples/monitoring/)
- 🛡️ [Security Hardening](examples/security/)

### **Template Components**
- 📋 [azurefireflydeploy.json](azurefireflydeploy.json) - Main onboarding template
- 📋 [azurefireflydeploy-managementgroups.json](azurefireflydeploy-managementgroups.json) - Management group deployment
- 🎨 [CreateUIDefinition.json](CreateUIDefinition.json) - UI for single/multi-subscription onboarding
- 🎨 [CreateUIDefinition-managementgroups.json](CreateUIDefinition-managementgroups.json) - UI for management group deployment

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

## 🏆 Acknowledgments

- 💙 **Microsoft Azure** team for ARM template platform
- 🚀 **Firefly Engineering** team for platform development
- 🌟 **Community Contributors** for feedback and improvements
- 🔧 **DevOps Community** for best practices and patterns

---

<p align="center">
  <strong>Made with ❤️ by the Firefly Team</strong><br>
  <em>Empowering cloud excellence through intelligent automation</em>
</p>

<p align="center">
  <img src="https://img.shields.io/github/stars/gofireflyio/arm-firefly-azure-onboarding?style=social" alt="GitHub Stars">
  <img src="https://img.shields.io/github/forks/gofireflyio/arm-firefly-azure-onboarding?style=social" alt="GitHub Forks">
  <img src="https://img.shields.io/github/watchers/gofireflyio/arm-firefly-azure-onboarding?style=social" alt="GitHub Watchers">
</p>
