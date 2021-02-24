using namespace System.Net

param($Request, $TriggerMetadata)
if($Request.Body.type -eq "url_verification"){
    #Slack Event Subscription通過用
    $body = ConvertTo-JSON @{
        StatusCode = [HttpStatusCode]::OK;
        Challenge = $Request.Body.challenge
        body = "Slack Event Subscription verification was succeeded."
    }
}elseif($Request.Body.type -eq 'event_callback'){
    # メイン処理
}else{
    "Failed"
    $body = ConvertTo-JSON @{
        StatusCode = [HttpStatusCode]::BadRequest;
        Body = "Bad Request."
    }
}

# response
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    Body = $body
})
