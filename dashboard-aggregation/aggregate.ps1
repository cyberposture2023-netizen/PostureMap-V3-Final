function AggregateDashboard {
    $risk = Get-Content 'risk-register\\risks.json' | ConvertFrom-Json
    $controls = Get-Content 'controls\\results.json' | ConvertFrom-Json
    $summary = @{
        RiskCount = $risk.Count
        ControlPassRate = ($controls.Passed / $controls.Total) * 100
    }
    Set-Content -Path 'dashboard\\summary.json' -Value ($summary | ConvertTo-Json)
}
