> apt-get update && apt-get upgrade
> sudo apt install postgresql-client -y
> psql -h cluster-jun.cn5xjy1wc0pt.eu-central-1.rds.amazonaws.com -p 5432 -d postgres -U postgres -W
>>>   \connect Database_name
>>>   \dt                             # show db