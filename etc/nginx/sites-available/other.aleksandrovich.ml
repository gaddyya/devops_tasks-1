# Permanent redirect to new URL
server {
	server_name other.aleksandrovich.ml;
	rewrite ^/(.*)$ https://aws.amazon.com//$1 permanent;


    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/other.aleksandrovich.ml/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/other.aleksandrovich.ml/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}

server {
    if ($host = other.aleksandrovich.ml) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


	server_name other.aleksandrovich.ml;
    listen 80;
    return 404; # managed by Certbot


}
