param([string]$TenantName = 'DemoTenant')
$statusPath = 'D:\PostureMap-V3-Final\integrations\SumoLogic\status.json'
$evidencePath = 'D:\PostureMap-V3-Final\integrations\SumoLogic\evidence.json'
$now = Get-Date -Format 'yyyy-MM-ddTHH:mm:ssZ'

# Mark connected
$status = Get-Content $statusPath | ConvertFrom-Json
$status.Connected = $true
$status.LastConnect = $now
Set-Content -Path $statusPath -Value ($status | ConvertTo-Json) -Encoding UTF8

# Seed demo evidence (category-specific)
$evidence = @{
  Vendor = 'SumoLogic'
  Category = 'Log Management'
  Connected = $true
  Tenant = $TenantName
  Timestamp = $now
  Data = {
    \"Sources\":  12,
    \"IngestGBPerDay\":  25,
    \"AlertsLast24h\":  3,
    \"RetentionDays\":  30
}
}
# The Data above is a serialized JSON string to simplify UI usage. Also store expanded variant:
$expanded = System.Collections.Hashtable = $expandedData = {
    "Sources":  12,
    "IngestGBPerDay":  25,
    "AlertsLast24h":  3,
    "RetentionDays":  30
} = $evidenceOut = @{
  Vendor = 'SumoLogic'
  Category = 'Log Management'
  Connected = $true
  Tenant = $TenantName
  Timestamp = $now
  Metrics = {
    "Sources":  12,
    "IngestGBPerDay":  25,
    "AlertsLast24h":  3,
    "RetentionDays":  30
}
}
Set-Content -Path $evidencePath -Value ($evidenceOut | ConvertTo-Json) -Encoding UTF8

Write-Host ' Connected: SumoLogic (Log Management)  Demo evidence seeded.'
