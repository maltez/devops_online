### Homework 5 ###
Here is the [link](https://github.com/nmurzin/devops_online/blob/master/homeworks/HomeWork-5.jpg) to homework task.
How to:  
1. Execute `make tf-build` to build container for running Terraform
2. Execute `make env` to generate env file for AWS credentials
3. Add your AWS creds to `.env` file
3. You can enjoy TF by using such commands `make tf cmd="any_tf_command"`. You can pass any TF command into cmd. 
As example: 
```
make tf cmd="plan"
make tf cmd="apply"
make tf cmd="destroy"
```