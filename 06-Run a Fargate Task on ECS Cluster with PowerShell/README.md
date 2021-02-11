## Learning Objectives

* Let's use the AWS Tools for PowerShell to spin up an AWS Fargate task with NGINX

### Common Issues

* **Task definition does not exist** - go back and create one or fix the name
* **Task definition does not support launch type FARGATE** - create a new version of your task definition that supports AWS Fargate as the "launch type"
* **Network Configuration must be provided when network mode is awsvpc** - fix the task definition