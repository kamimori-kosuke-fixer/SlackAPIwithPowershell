#urlやbodyはSlack API公式を参照して変更してください。
$token = "xxxx-"
$channel = ""
$baseUrl = "https://slack.com/api";
$url = "${baseUrl}/conversations.history"
$method = "GET"
$UNIX_EPOCH = Get-Date("1970/1/1 0:0:0 GMT")

$response = `
(Invoke-RestMethod `
    -Uri $url `
    -Method $method `
    -Body @{
        token="$Token";
        channel="$channel"
        limit=1;
        oldest=((Get-Date).AddHours(-1) - $UNIX_EPOCH).TotalSeconds;
        latest=((Get-Date) - $UNIX_EPOCH).TotalSeconds;
    }
)
echo $response
