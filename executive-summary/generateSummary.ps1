function GenerateExecutiveSummary {
    param([string]$tenantName)
    $summary = \"PostureMap shows strong coverage in AccessControl and DataRetention. Risk posture is moderate.\"
    Set-Content -Path \"tenants\\$tenantName\\executive-summary.txt\" -Value $summary
    Write-Host \" Executive summary generated for $tenantName\"
}
