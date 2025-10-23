function ExportComplianceBundle {
    param([string]$framework)
    Copy-Item \"D:\\PostureMap-V3-Final\\locker-$framework\\*\" -Destination \"D:\\Exports\\$framework\" -Recurse
}
