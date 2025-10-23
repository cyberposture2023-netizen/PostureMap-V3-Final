function LogAuditEvent {
    param([string]$user, [string]$action)
    Add-Content -Path 'audit-trail\\audit.log' -Value \"$(Get-Date) - $user - $action\"
}
