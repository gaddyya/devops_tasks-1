import boto3
from variables import *

client = boto3.client('ec2-instance-connect')
response = client.send_ssh_public_key(
    InstanceId=instance_id,
    InstanceOSUser='ec2-user',
    SSHPublicKey=ssh_public_key,
    AvailabilityZone=availability_zone
)