param([string]$TenantName = 'DemoTenant')
$statusPath = 'D:\PostureMap-V3-Final\integrations\AWS\status.json'
$evidencePath = 'D:\PostureMap-V3-Final\integrations\AWS\evidence.json'
$now = Get-Date -Format 'yyyy-MM-ddTHH:mm:ssZ'

# Mark connected
$status = Get-Content $statusPath | ConvertFrom-Json
$status.Connected = $true
$status.LastConnect = $now
Set-Content -Path $statusPath -Value ($status | ConvertTo-Json) -Encoding UTF8

# Seed demo evidence (category-specific)
$evidence = @{
  Vendor = 'AWS'
  Category = 'Cloud Security'
  Connected = $true
  Tenant = $TenantName
  Timestamp = $now
  Data = {
    \"PublicResources\":  1,
    \"CISCompliance\":  0.84,
    \"S3Buckets\":  18,
    \"Encryption\":  \"Enabled\"
}
}
# The Data above is a serialized JSON string to simplify UI usage. Also store expanded variant:
$expanded = System.Collections.Hashtable = $expandedData = {
    "PublicResources":  1,
    "CISCompliance":  0.84,
    "S3Buckets":  18,
    "Encryption":  "Enabled"
} = $evidenceOut = @{
  Vendor = 'AWS'
  Category = 'Cloud Security'
  Connected = $true
  Tenant = $TenantName
  Timestamp = $now
  Metrics = {
    "PublicResources":  1,
    "CISCompliance":  0.84,
    "S3Buckets":  18,
    "Encryption":  "Enabled"
}
}
Set-Content -Path $evidencePath -Value ($evidenceOut | ConvertTo-Json) -Encoding UTF8

Write-Host ' Connected: AWS (Cloud Security)  Demo evidence seeded.'
