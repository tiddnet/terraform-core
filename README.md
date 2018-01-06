# terraform-core


First time setup: 

```mv terraform_remote.tf terraform_remote.tf.no
terraform get
terraform init
terraform plan
terraform apply (creates dynamoDB and s3 buckets)
mv terraform_remote.tf.no terraform_remote.tf
terraform init (copy configuration from local to s3
```


DNS: 
- Zones
- Delegation records


Create base module to expose: 

Network:
- VPC
- subnets [private, public] 

Security Policy:
- Security groups
- Define bastion hosts

TODO: 

Logging:

Monitoring:

Alerting conditions: 



