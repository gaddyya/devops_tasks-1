#!/bin/bash
file_location_repo=/etc/yum.repos.d/elasticsearch.repo
file_location_config=/etc/elasticsearch/elasticsearch.yml
file_location_options=/etc/elasticsearch/jvm.options
file_location_override=/etc/systemd/system/elasticsearch.service.d/override.conf
file_name=elasticsearch.repo
aws_region=eu-central-1
cluster_name=production
cluster_tag=production


rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

cat > $file_location_repo <<EOF
[elasticsearch]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=0
autorefresh=1
type=rpm-md
EOF

yum install --enablerepo=elasticsearch elasticsearch -y
/usr/share/elasticsearch/bin/elasticsearch-plugin install discovery-ec2 -b

cat > $file_location_config <<EOF
cluster.name: $cluster_name
#cluster.initial_master_nodes: [private_ip_of_instance_in_us_east_1b,private_ip_of_instance_in_us_east_1c]
bootstrap.memory_lock: true
network.host: [_local_,_site_]
discovery.seed_providers: ec2
discovery.ec2.endpoint: ec2.$aws_region.amazonaws.com
dicovery.ec2.tag.cluster_name: $cluster_tag
cloud.node.auto_attributes: true
cluster.routing.allocation.awareness.attributes: aws_availability_zone
logger.org.elasticsearch.discovery.ec2: "TRACE"
EOF

cat > $file_location_options <<EOF
-Xms1g
-Xmx1g
EOF

cat > $file_location_override <<EOF
[Service]
LimitMEMLOCK=infinity
EOF



/bin/systemctl daemon-reload
/bin/systemctl enable elasticsearch.service
systemctl start elasticsearch.service
curl -X GET "localhost:9200/?pretty"