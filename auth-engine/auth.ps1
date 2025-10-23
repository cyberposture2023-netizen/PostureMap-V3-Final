function AuthenticateUser {
    param([string]$username, [string]$password)
    $stored = Get-Content 'users.json' | ConvertFrom-Json
    return $stored | Where-Object { $_.user -eq $username -and $_.pass -eq $password }
}
