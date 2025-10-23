param([string]$TenantName = 'DemoTenant')
$statusPath = 'D:\PostureMap-V3-Final\integrations\WorkspaceONE\status.json'
$evidencePath = 'D:\PostureMap-V3-Final\integrations\WorkspaceONE\evidence.json'
$now = Get-Date -Format 'yyyy-MM-ddTHH:mm:ssZ'

# Mark connected
$status = Get-Content $statusPath | ConvertFrom-Json
$status.Connected = $true
$status.LastConnect = $now
Set-Content -Path $statusPath -Value ($status | ConvertTo-Json) -Encoding UTF8

# Seed demo evidence (category-specific)
$evidence = @{
  Vendor = 'WorkspaceONE'
  Category = 'Device Management'
  Connected = $true
  Tenant = $TenantName
  Timestamp = $now
  Data = {
    \"ComplianceRate\":  0.92,
    \"AgentHeartbeat\":  \"OK\",
    \"EnrolledDevices\":  350
}
}
# The Data above is a serialized JSON string to simplify UI usage. Also store expanded variant:
$expanded = System.Collections.Hashtable = $expandedData = {
    "ComplianceRate":  0.92,
    "AgentHeartbeat":  "OK",
    "EnrolledDevices":  350
} = $evidenceOut = @{
  Vendor = 'WorkspaceONE'
  Category = 'Device Management'
  Connected = $true
  Tenant = $TenantName
  Timestamp = $now
  Metrics = {
    "ComplianceRate":  0.92,
    "AgentHeartbeat":  "OK",
    "EnrolledDevices":  350
}
}
Set-Content -Path $evidencePath -Value ($evidenceOut | ConvertTo-Json) -Encoding UTF8

Write-Host ' Connected: WorkspaceONE (Device Management)  Demo evidence seeded.'
