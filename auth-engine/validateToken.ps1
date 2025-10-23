function ValidateToken {
    param([string]$token)
    $valid = Get-Content 'auth-engine\\tokens.json' | ConvertFrom-Json
    return $valid -contains $token
}
