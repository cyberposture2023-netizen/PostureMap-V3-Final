function GenerateAuditBundle {
    param([string]$tenantName)
    $bundlePath = \"tenants\\$tenantName\\audit-bundle\"
    New-Item -Path $bundlePath -ItemType Directory -Force | Out-Null
    Copy-Item \"tenants\\$tenantName\\controls\\*\" -Destination \"\\controls\" -Recurse
    Copy-Item \"tenants\\$tenantName\\policies\\*\" -Destination \"\\policies\" -Recurse
    Copy-Item \"tenants\\$tenantName\\risks\\*\" -Destination \"\\risks\" -Recurse
    Copy-Item \"tenants\\$tenantName\\ai\\*\" -Destination \"\\ai\" -Recurse
    Write-Host \" Audit bundle generated for $tenantName\"
}
