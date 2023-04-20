# ACCESS TO YANDEX REGISTRY
> 1. Create service account with admin role for catalog via yandex ui for specific catalog


> 2. Login in yandex cli with user which has role <resource-manager.clouds.owner> or better

> 3. Create key.json with this one command:
```
yc iam key create --folder-name test  --service-account-name test  -o key.json
```

> 4. Move this key.json file in the remote server and set env variables:

```
export YC_CONTAINER_REGISTRY_LOGIN=json_key
```
```
export YC_CONTAINER_REGISTRY=cr.yandex
```
> 5. Run command for login in yandex container rergistry
```
cat key.json | docker login --username $YC_CONTAINER_REGISTRY_LOGIN --password-stdin $YC_CONTAINER_REGISTRY
```
