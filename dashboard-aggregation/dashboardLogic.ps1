function AggregateDashboard {
    param([string]$riskPath, [string]$controlPath)
    $risks = Get-Content $riskPath | ConvertFrom-Json
    $controls = Get-Content $controlPath | ConvertFrom-Json
    return @{
        RiskCount = $risks.Count
        ControlPassRate = ($controls.Passed / $controls.Total) * 100
    }
}
