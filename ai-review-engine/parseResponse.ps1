function ParseAIResponse {
    param([string]$response)
    $lines = $response -split \"
\"
    return @{
        Score = $lines[0]
        Summary = $lines[1]
        Recommendation = $lines[2]
    }
}
