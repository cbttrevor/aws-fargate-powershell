Get-AWSCmdletName -Service ecs | ? CmdletName -match 'defini'

# Documentation for RegisterTaskDefinition API call https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_RegisterTaskDefinition.html

Get-Help -Name Register-ECSTaskDefinition

# Network mode of 'awsvpc' is mandatory specifically for Fargate tasks
Register-ECSTaskDefinition -NetworkMode awsvpc -cont

$C1 = [Amazon.ECS.Model.ContainerDefinition]::new()
$C1.Image = 'docker.io/library/nginx'
$C1.Name = 'webserver'
$C1.Memory = 512

# The following commands works, but there's a problem ... it won't work with FARGATE. Let's fix that.
Register-ECSTaskDefinition -NetworkMode awsvpc -ContainerDefinition $C1 -Family trevornginx

# We specify the compatibility (aka. launch type) of FARGATE (versus EC2)
Register-ECSTaskDefinition -NetworkMode awsvpc -ContainerDefinition $C1 -Family trevornginx -RequiresCompatibility FARGATE

# .... oh no, we have to specify CPU and memory allocation!
$ECSParams = @{
    NetworkMode = 'awsvpc'
    ContainerDefinition = $C1
    Family = 'trevornginx'
    RequiresCompatibility = 'FARGATE' 
    Memory = 1024
    Cpu = 512
}
Register-ECSTaskDefinition @ECSParams
