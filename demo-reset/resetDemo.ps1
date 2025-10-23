function ResetDemoData {
    param([string]$tenantName)
    Copy-Item \"demo.json\" -Destination \"tenants\\$tenantName\\demo.json\" -Force
    Write-Host \" Demo data reset for $tenantName\"
}
