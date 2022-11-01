upstream app {
      server 127.0.0.1:2000;
      server 127.0.0.1:3000;
   }


   server {
      listen 80;
      server_name balance.aleksandrovich.ml;
      access_log /var/log/nginx/app-access.log;
      error_log /var/log/nginx/app-error.log;
      location / {
          proxy_pass http://app;
          proxy_read_timeout 15;
          proxy_connect_timeout 3;
          include proxy_params;
      }