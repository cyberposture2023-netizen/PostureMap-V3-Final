function DeployToStaging {
    Copy-Item 'D:\\PostureMap-V3-Final\\*' -Destination 'D:\\Staging\\' -Recurse -Force
    Write-Host ' Deployed to staging.'
}
