function PublishTenantListing {
    param([string]$tenantName)
    $listing = @{
        Name = $tenantName
        Modules = 'Intake, Controls, Risk, Policies, Dashboard'
        Status = 'Ready'
        Score = 95
    }
    Set-Content -Path \"marketplace\\$tenantName-listing.json\" -Value ($listing | ConvertTo-Json)
    Write-Host \" Published marketplace listing for $tenantName\"
}
