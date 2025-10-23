function ApplyBranding {
    param([string]$tenantName, [string]$logoPath, [string]$color)
    $branding = @{
        Logo = $logoPath
        Color = $color
        Footer = \"Powered by PostureMap\"
    }
    Set-Content -Path \"tenants\\$tenantName\\branding.json\" -Value ($branding | ConvertTo-Json)
}
