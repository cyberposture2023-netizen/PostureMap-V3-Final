function MapControlsToFramework {
    $controls = Get-Content 'controls\\mapped.json' | ConvertFrom-Json
    $matrix = @{}
    foreach ($c in $controls) {
        switch ($c) {
            'AccessControl' { $matrix['NIST-AC-1'] = 'Mapped' }
            'DataRetention' { $matrix['ISO-A.8.5'] = 'Mapped' }
        }
    }
    Set-Content -Path 'compliance-matrix\\matrix.json' -Value ($matrix | ConvertTo-Json)
}
