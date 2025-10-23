function DeleteTenant {
    param([string]$tenantName)
    $path = \"D:\\PostureMap-V3-Final\\tenants\\$tenantName\"
    Remove-Item -Path $path -Recurse -Force
    Add-Content -Path 'audit-trail\\audit.log' -Value \"$(Get-Date) - Deleted tenant $tenantName\"
}
