function PackageInstaller {
    param([string]$tenantName)
    $source = \"tenants\\$tenantName\\\"
    $target = \"installers\\$tenantName.zip\"
    Compress-Archive -Path $source -DestinationPath $target -Force
    Write-Host \" Installer packaged for $tenantName\"
}
