FROM nginx:alpine

RUN apk update


RUN mkdir -p "/var/www/html/download" "/var/www/app" "/var/www/html/images" "/etc/letsencrypt"
COPY nginx.conf /etc/nginx/nginx.conf
COPY aleksandrovich.conf /etc/nginx/conf.d/aleksandrovich.conf
COPY index.html /usr/share/nginx/html/index.html
COPY style.css /usr/share/nginx/html/style.css
COPY app.html /var/www/app/index.html
COPY aws.png /var/www/html/images/aws.png
COPY gcp.jpg /var/www/html/images/gcp.jpg
COPY song.mp3 /var/www/html/download/song.mp3

COPY fullchain.pem /etc/letsencrypt/fullchain.pem
COPY privkey.pem /etc/letsencrypt/privkey.pem

EXPOSE 80 443 8080



