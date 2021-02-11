# Which PowerShell commands enable you to interact with ECS Cluster entities?
Get-AWSCmdletName -Service ecs | ? CmdletName -match cluster

New-ECSCluster

New-ECSCluster -ClusterName myfargate

Remove-ECSCluster -Cluster default -Force