import boto3
from variables import *

ec2 = boto3.resource('ec2')
instances = ec2.create_instances(
        ImageId=image_id,
        SubnetId=subnet_id,
        SecurityGroupIds=security_group_id,
        MinCount=1,
        MaxCount=1,
        InstanceType=instance_type,
        KeyName=ssh_key
    )