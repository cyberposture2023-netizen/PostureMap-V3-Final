param([string]$TenantName = 'DemoTenant')
$statusPath = 'D:\PostureMap-V3-Final\integrations\GoogleWorkspace\status.json'
$evidencePath = 'D:\PostureMap-V3-Final\integrations\GoogleWorkspace\evidence.json'
$now = Get-Date -Format 'yyyy-MM-ddTHH:mm:ssZ'

# Mark connected
$status = Get-Content $statusPath | ConvertFrom-Json
$status.Connected = $true
$status.LastConnect = $now
Set-Content -Path $statusPath -Value ($status | ConvertTo-Json) -Encoding UTF8

# Seed demo evidence (category-specific)
$evidence = @{
  Vendor = 'GoogleWorkspace'
  Category = 'Identity & Access'
  Connected = $true
  Tenant = $TenantName
  Timestamp = $now
  Data = {
    \"LastSync\":  \"2025-10-23T10:00:00Z\",
    \"MFA\":  \"Enabled\",
    \"Users\":  120
}
}
# The Data above is a serialized JSON string to simplify UI usage. Also store expanded variant:
$expanded = System.Collections.Hashtable = $expandedData = {
    "LastSync":  "2025-10-23T10:00:00Z",
    "MFA":  "Enabled",
    "Users":  120
} = $evidenceOut = @{
  Vendor = 'GoogleWorkspace'
  Category = 'Identity & Access'
  Connected = $true
  Tenant = $TenantName
  Timestamp = $now
  Metrics = {
    "LastSync":  "2025-10-23T10:00:00Z",
    "MFA":  "Enabled",
    "Users":  120
}
}
Set-Content -Path $evidencePath -Value ($evidenceOut | ConvertTo-Json) -Encoding UTF8

Write-Host ' Connected: GoogleWorkspace (Identity & Access)  Demo evidence seeded.'
