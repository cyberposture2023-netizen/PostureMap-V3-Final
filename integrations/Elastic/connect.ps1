param([string]$TenantName = 'DemoTenant')
$statusPath = 'D:\PostureMap-V3-Final\integrations\Elastic\status.json'
$evidencePath = 'D:\PostureMap-V3-Final\integrations\Elastic\evidence.json'
$now = Get-Date -Format 'yyyy-MM-ddTHH:mm:ssZ'

# Mark connected
$status = Get-Content $statusPath | ConvertFrom-Json
$status.Connected = $true
$status.LastConnect = $now
Set-Content -Path $statusPath -Value ($status | ConvertTo-Json) -Encoding UTF8

# Seed demo evidence (category-specific)
$evidence = @{
  Vendor = 'Elastic'
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
  Vendor = 'Elastic'
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

Write-Host ' Connected: Elastic (Log Management)  Demo evidence seeded.'
