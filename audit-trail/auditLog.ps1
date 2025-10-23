function LogAuditEvent {
    param([string]$user, [string]$action)
    Add-Content -Path 'audit.log' -Value \"$(Get-Date) - $user - $action\"
}
