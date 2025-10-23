function RunControlTest {
    param([string]$controlName, [string]$evidencePath)
    $evidence = Get-Content $evidencePath
    if ($evidence.Length -gt 100) { return 'Pass' } else { return 'Fail' }
}
