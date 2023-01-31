# Install and Configure Elastic Search cluster on AWS Linux 2

### Elasticsearch Setup

> Switch to root user

```
sudo su
```

> Import Elasticsearch PGP Key

```
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
```

> Configure RPM Repository for Elasticsearch

```
cd /etc/yum.repos.d/
```

> Create new file

```
vi elasticsearch.repo
```

> Add this content to new file

```
[elasticsearch]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=0
autorefresh=1
type=rpm-md
```

> Install Elasticsearch from RPM Repository

```
yum install --enablerepo=elasticsearch elasticsearch -y
```

### Configure Elasticsearch to run on bootup

> To configure Elasticsearch to start automatically when the system boots up, run the following commands:

```
/bin/systemctl daemon-reload
/bin/systemctl enable elasticsearch.service
```

> Start Elasticsearch

```
systemctl start elasticsearch.service
```

> Let’s check the logs to see if the Elasticsearch process started without any issues:(Note: Log file is named after cluster name)

```
cd /var/log/elasticsearch
view elasticsearch.log
```

> See cluster details

```
curl -X GET "localhost:9200/?pretty"
```

### Configuring Elasticsearch

> Explain

```
command
```

> Explain

```
command
```

> Explain

```
command
```

> Explain

```
command
```

> Explain

```
command
```

> Explain

```
command
```

> Explain

```
command
```

> Explain

```
command
```
