function RunSmokeTest {
    param([string]$tenantName)
    $modules = 'intake', 'controls', 'risk', 'dashboard', 'ai-review-engine'
    foreach ($m in $modules) {
        $path = \"tenants\\$tenantName\\$m\\\"
        if (-not (Test-Path $path)) {
            Write-Host \" Missing: $m\"
        } else {
            Write-Host \" Found: $m\"
        }
    }
}
