server {
        root /var/www/music.aleksandrovich.ml/;
        server_name music.aleksandrovich.ml;
        index index.html;
        location ~*\.mp3$ {
                try_files $uri $uri/ =404;
                root /var/www/music.aleksandrovich.ml/;
                add_header Content-Disposition "attachment";
                add_header Content-Type "application/force-download";
                add_header Content-Type "application/octet-stream";
        }


    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/music.aleksandrovich.ml/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/music.aleksandrovich.ml/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = music.aleksandrovich.ml) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


        server_name music.aleksandrovich.ml;
    listen 80;
    return 404; # managed by Certbot


}
