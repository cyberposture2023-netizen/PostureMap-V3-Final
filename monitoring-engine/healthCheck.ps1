function RunHealthCheck {
    $modules = 'intake', 'controls', 'risk-register', 'dashboard'
    foreach ($m in $modules) {
        if (-not (Test-Path \"D:\\PostureMap-V3-Final\\$m\\\")) {
            Write-Host \" Missing: $m\"
        } else {
            Write-Host \" Found: $m\"
        }
    }
}
