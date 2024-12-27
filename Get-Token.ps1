<#
.Synopsis
   This function generates a Microsoft Graph API access token.
.DESCRIPTION
   The function designed for this purpose ensures a secure and efficient way to generate the access token. 
   Once generated, this token will enable us to interact with various Microsoft services and retrieve the required data seamlessly.

.EXAMPLE
   Get-Token -clientId "1780x7a4-326x-438a-xxx3-3bf9d9d9d9d9c0" -clientSecret "G0000~xikNCcxxxxxxPeEJLZQIWy4qr5r5r-uas2" -tenantId "820000c7-b00c-4x84-8004-10dcaa2xxxx7"

.NOTES
  Version:             1.0
  Author:              Gautam Sharma @ergautamsharma
  Source:              https://github.com/ergautamsharma/PSModules
  Creation Date:       December 27, 2024
  Last Update Date:    December 27, 2024
#>

function Get-Token
{
    param(
        [string]$clientId,
        [string]$clientSecret,
        [string]$tenantId
    )
 
    $body = @{
        grant_type    = "client_credentials"
        scope         = "https://graph.microsoft.com/.default"
        client_id     = $clientId
        client_secret = $clientSecret
    }
 
    $tokenResponse = Invoke-RestMethod -Uri "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token" -Method Post -Body $body
    $accessToken = $tokenResponse.access_token
    return $accessToken
 
}
$clientId = "1780x7a4-326x-438a-xxx3-3bf9d9d9d9d9c0"
$clientSecret = "G0000~xikNCcxxxxxxPeEJLZQIWy4qr5r5r-uas2"
$tenantId = "820000c7-b00c-4x84-8004-10dcaa2xxxx7"
$accessToken = Get-Token -clientId $clientId -clientSecret $clientSecret -tenantId $tenantId