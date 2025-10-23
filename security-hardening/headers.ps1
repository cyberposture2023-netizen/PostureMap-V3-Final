function SetSecureHeaders {
    Add-Type -AssemblyName System.Web
    $ctx = [System.Web.HttpContext]::Current
    $ctx.Response.Headers.Add('X-Content-Type-Options', 'nosniff')
    $ctx.Response.Headers.Add('X-Frame-Options', 'DENY')
}
