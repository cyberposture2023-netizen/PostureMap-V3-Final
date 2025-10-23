function Get-PostureMapData {
    param([string]$module)
    $path = \"D:\\PostureMap-V3-Final\\$module\\demo.json\"
    return Get-Content $path | ConvertFrom-Json
}
