function SanitizeInput {
    param([string]$input)
    return $input -replace '[<>]', ''
}
