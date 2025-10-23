param([string]$TenantName = 'DemoTenant')
$statusPath = 'D:\PostureMap-V3-Final\integrations\GitLab\status.json'
$evidencePath = 'D:\PostureMap-V3-Final\integrations\GitLab\evidence.json'
$now = Get-Date -Format 'yyyy-MM-ddTHH:mm:ssZ'

# Mark connected
$status = Get-Content $statusPath | ConvertFrom-Json
$status.Connected = $true
$status.LastConnect = $now
Set-Content -Path $statusPath -Value ($status | ConvertTo-Json) -Encoding UTF8

# Seed demo evidence (category-specific)
$evidence = @{
  Vendor = 'GitLab'
  Category = 'Code & App Security'
  Connected = $true
  Tenant = $TenantName
  Timestamp = $now
  Data = {
    \"SecurityFindings\":  5,
    \"Policies\":  \"Branch Protection Enabled\",
    \"OpenPRs\":  23
}
}
# The Data above is a serialized JSON string to simplify UI usage. Also store expanded variant:
$expanded = System.Collections.Hashtable = $expandedData = {
    "SecurityFindings":  5,
    "Policies":  "Branch Protection Enabled",
    "OpenPRs":  23
} = $evidenceOut = @{
  Vendor = 'GitLab'
  Category = 'Code & App Security'
  Connected = $true
  Tenant = $TenantName
  Timestamp = $now
  Metrics = {
    "SecurityFindings":  5,
    "Policies":  "Branch Protection Enabled",
    "OpenPRs":  23
}
}
Set-Content -Path $evidencePath -Value ($evidenceOut | ConvertTo-Json) -Encoding UTF8

Write-Host ' Connected: GitLab (Code & App Security)  Demo evidence seeded.'
