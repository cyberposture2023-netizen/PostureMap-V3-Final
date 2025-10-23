function CalculateRiskScore {
    param([int]$severity, [int]$likelihood)
    return $severity * $likelihood
}
