$token = "xxxx-"
$channel = ""
$api_url = "https://slack.com/api/conversations.history"
$method = "GET"

Invoke-RestMethod `
    -Uri $api_url `
    -Method $method `
    -Body @{
        token="$Token";
        channel="$channel"
    }
