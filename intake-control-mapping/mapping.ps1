function MapIntakeToControls {
    param([string]$intakePath)
    $intake = Get-Content $intakePath | ConvertFrom-Json
    $controls = @()
    foreach ($item in $intake.responses) {
        if ($item.category -eq 'Security') { $controls += 'AccessControl' }
        if ($item.category -eq 'Privacy')  { $controls += 'DataRetention' }
    }
    return $controls
}
