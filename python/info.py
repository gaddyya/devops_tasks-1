import boto3
from datetime import date, datetime, timedelta
from variables import *

session = boto3.Session(profile_name="default", region_name="eu-central-1")  # boto3 session, aws profile
ec2 = boto3.resource('ec2')
instance = ec2.Instance(instance_id)
info_file = open("./output/ec2_info.txt", "w+")
info_file.write('Public ipv4: ' + instance.public_ip_address + '\n')
info_file.write('Type: ' + instance.instance_type + '\n')
info_file.write('OS: ' + str(instance.platform_details) + '\n')
info_file.close()

client = boto3.client(service_name='cloudwatch', region_name='eu-central-1')
metrics_file = open("./output/metrics.txt", "w+")
metrics_list = ["CPUUtilization", "DiskReadOps", "DiskWriteOps", "DiskReadBytes", "DiskWriteBytes",
                "MetadataNoToken", "NetworkIn", "NetworkOut", "NetworkPacketsIn", "NetworkPacketsOut"]

for metric in metrics_list:
    response = client.get_metric_statistics(
        Namespace='AWS/EC2',
        Period=300,
        StartTime=datetime.utcnow() - timedelta(seconds=600),
        EndTime=datetime.utcnow(),
        MetricName=metric,
        Statistics=['Average'], Unit='Percent',
        Dimensions=[
            {'Name': 'InstanceId', 'Value': instance_id}
        ])
    metrics_file.write(str(response))
    metrics_file.write('\n')

metrics_file.close()
