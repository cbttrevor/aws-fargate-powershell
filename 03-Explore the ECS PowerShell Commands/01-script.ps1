Get-AWSCmdletName -ApiOperation CreateCluster
Get-AWSCmdletName -Service ecs | Where-Object -FilterScript { $PSItem.CmdletName -match 'service' }

Get-Command Get-AWSCmdletName 