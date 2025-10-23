param([string]$TenantName = 'DemoTenant')
$statusPath = 'D:\PostureMap-V3-Final\integrations\Wiz\status.json'
$evidencePath = 'D:\PostureMap-V3-Final\integrations\Wiz\evidence.json'
$now = Get-Date -Format 'yyyy-MM-ddTHH:mm:ssZ'

# Mark connected
$status = Get-Content $statusPath | ConvertFrom-Json
$status.Connected = $true
$status.LastConnect = $now
Set-Content -Path $statusPath -Value ($status | ConvertTo-Json) -Encoding UTF8

# Seed demo evidence (category-specific)
$evidence = @{
  Vendor = 'Wiz'
  Category = 'Vulnerability Management'
  Connected = $true
  Tenant = $TenantName
  Timestamp = $now
  Data = {
    \"Critical\":  2,
    \"ScanWindowDays\":  7,
    \"Medium\":  41,
    \"High\":  14
}
}
# The Data above is a serialized JSON string to simplify UI usage. Also store expanded variant:
$expanded = System.Collections.Hashtable = $expandedData = {
    "Critical":  2,
    "ScanWindowDays":  7,
    "Medium":  41,
    "High":  14
} = $evidenceOut = @{
  Vendor = 'Wiz'
  Category = 'Vulnerability Management'
  Connected = $true
  Tenant = $TenantName
  Timestamp = $now
  Metrics = {
    "Critical":  2,
    "ScanWindowDays":  7,
    "Medium":  41,
    "High":  14
}
}
Set-Content -Path $evidencePath -Value ($evidenceOut | ConvertTo-Json) -Encoding UTF8

Write-Host ' Connected: Wiz (Vulnerability Management)  Demo evidence seeded.'
