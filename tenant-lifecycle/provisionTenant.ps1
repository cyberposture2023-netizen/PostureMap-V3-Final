function ProvisionTenant {
    param([string]$tenantName)
    $path = \"D:\\PostureMap-V3-Final\\tenants\\$tenantName\"
    New-Item -Path $path -ItemType Directory -Force | Out-Null
    Copy-Item \"D:\\PostureMap-V3-Final\\demo.json\" -Destination \"D:\PostureMap-V3-Final\launch-validation\\demo.json\" -Force
    Write-Host \" Tenant provisioned: $tenantName\"
}
