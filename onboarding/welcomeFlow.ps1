function ShowWelcome {
    param([string]$tenantName)
    $msg = \"Welcome to PostureMap, $tenantName! Your modules are ready.\"
    Set-Content -Path \"tenants\\$tenantName\\welcome.txt\" -Value $msg
}
