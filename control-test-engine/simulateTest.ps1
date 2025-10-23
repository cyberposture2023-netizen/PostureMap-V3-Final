function SimulateControlTest {
    param([string]$controlName)
    $result = if ($controlName -eq 'AccessControl') { 'Pass' } else { 'Fail' }
    Set-Content -Path \"controls\\results.json\" -Value (@{ Passed = 1; Total = 2 } | ConvertTo-Json)
    Write-Host \" Simulated test for $controlName: $result\"
}
