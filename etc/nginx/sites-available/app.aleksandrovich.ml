server {
	server_name app.aleksandrovich.ml;
	root /var/www/app.aleksandrovich.ml/;
	index index.html index.htm index.nginx-debian.html;
	location / {
		try_files $uri $uri/ =404;
	}
  location ~* \.(jpg|jpeg)$ {
                root /var/www/app.aleksandrovich.ml/;
                image_filter rotate 180;
  }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/app.aleksandrovich.ml/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/app.aleksandrovich.ml/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}


server {
    if ($host = app.aleksandrovich.ml) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


	server_name app.aleksandrovich.ml;
	listen 80;

	server_name _;
    return 404; # managed by Certbot


}
