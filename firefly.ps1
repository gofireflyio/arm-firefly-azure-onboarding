$ErrorActionPreference = 'Stop'

try {
    Write-Host 'Fetching Firefly IPs from API...'

    $response = Invoke-RestMethod `
        -Uri 'https://api.firefly.ai/v2/infrastructure/public-nat-ips' `
        -Method Get `
        -TimeoutSec 30

    if ($response -and $response.ips -and $response.ips.Count -gt 0) {
        Write-Host "Successfully fetched $($response.ips.Count) IPs from API"
        $ipsArray = $response.ips
    }
    else {
        Write-Warning 'API response was empty or invalid, using fallback IPs'
        $ipsArray = $Env:FALLBACK_IPS | ConvertFrom-Json
    }
}
catch {
    Write-Warning "Failed to fetch IPs from API: $($_.Exception.Message)"
    Write-Host 'Using fallback IPs'
    $ipsArray = $Env:FALLBACK_IPS | ConvertFrom-Json
}

$DeploymentScriptOutputs = @{}
$DeploymentScriptOutputs['ips'] = $ipsArray

Write-Host "Output IPs: $($ipsArray -join ', ')"
