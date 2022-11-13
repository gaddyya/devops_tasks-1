from variables import *
import boto3
import paramiko as paramiko

def ssh_connect_with_retry(ssh, ip_address, retries):
    if retries > 3:
        return False
    privkey = paramiko.RSAKey.from_private_key_file(
        '/Users/vadik/.ssh/trainee8.pem')
    interval = 5
    try:
        retries += 1
        print('SSH into the instance: {}'.format(ip_address))
        ssh.connect(hostname=ip_address,
                    username='ec2-user', pkey=privkey)
        return True
    except Exception as e:
        print(e)
        time.sleep(interval)
        print('Retrying SSH connection to {}'.format(ip_address))
        ssh_connect_with_retry(ssh, ip_address, retries)

# get your instance ID from AWS dashboard

# get instance
ec2 = boto3.resource('ec2', region_name='eu-central-1')
instance = ec2.Instance(id=instance_id)
instance.wait_until_running()
current_instance = list(ec2.instances.filter(InstanceIds=[instance_id]))
ip_address = current_instance[0].public_ip_address

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

ssh_connect_with_retry(ssh, ip_address, 0)

stdin, stdout, stderr = ssh.exec_command("echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDuDyGby7zPeVJYkbsCpB2Ug9VCs9t4h2nOOJx3oP/ac6TgXW3S2rrQMpiJBeUIb4neO4kJmh/8XS10l7QMcelHKgE2+GlyXgbkWH536obwPdET/+taU91ZBZtnLq4wiF0rjG/dDqtu9Uu6CupSdCgn2pnRDjCKqhxW3k2B+hefK87K2168Ni+QZ/4ysuRzXFRrALnNXu+nAbLkXDPkQ6GuAmz5Ph9ysEeoaC7HR3rSoZOSx79syUvea+Divi0EQZzm0x2Mbj5CBRLD2/jCR6a5Y0UwWGlZDAcBNFUaemDkZpkvx8LL840koY+TkN+GH5xMdAyeJ+nFCBW5zN0oWsw2z+dsfNkhksigimID+y3H8uQhgVuc7+TOJk57BTyHUnbwXfjOUIfTN5CoweQaTdzM08Eys2oI9ODZ2k1BPEaaTa6QowqVoBPCt7qMlPcOKwzdr4AiHlInbYyPdHfprd13YnAbMqqJAli5abewrgnmGJBJ0JfbY3IvBQrtY+TnlVM= vadik@MacBook-Pro-Vadim.local > /home/ec2-user/.ssh/authorized_keys")
print('stdout:', stdout.read())
print('stderr:', stderr.read())