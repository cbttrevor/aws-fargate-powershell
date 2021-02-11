Get-AWSCmdletName -Service ecs | ? CmdletName -match task

# Looks like we want the New-ECSTask command

# Documentation for RunTask API call https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_RunTask.html

New-ECSTask -Cluster myfargate -Count 1 -LaunchType FARGATE -TaskDefinition trevornginx

# ERROR: New-ECSTask: Network Configuration must be provided when networkMode 'awsvpc' is specified.

New-ECSTask -Cluster MyFargate -Count 1 -LaunchType FARGATE -TaskDefinition trevornginx -AwsvpcConfiguration_AssignPublicIp ENABLED

# ERROR: New-ECSTask: subnets can not be null or have null elements
New-ECSTask -Cluster myfargate -Count 1 -LaunchType FARGATE -TaskDefinition trevornginx -AwsvpcConfiguration_AssignPublicIp ENABLED -AwsvpcConfiguration_SecurityGroup sg-f2cdb7a3 -AwsvpcConfiguration_Subnet subnet-c0fd07b8

Get-ECSTaskList -Cluster myfargate
$MyTask = Get-ECSTaskDetail -Cluster myfargate -Task arn:aws:ecs:us-west-2:665453315198:task/myfargate/65cb33d1919c453184e839941076b7c6

Stop-ECSTask -Task arn:aws:ecs:us-west-2:665453315198:task/myfargate/65cb33d1919c453184e839941076b7c6 -Cluster myfargate