events {

 worker_connections 1024;

 }

 http {

 keepalive_timeout 5;

 upstream tomcatServers {

 keepalive 50;

 server 172.31.33.234:9980;server 172.31.29.193:8080;server 172.31.28.118:8080

 2 checks...

 2 checks...

 NOT

 server {

 2checks...

 listen 80;location / {

 2 checks...

 proxy_set_headerproxy_set_header

 X-Real-IP $remote_addr;

 X-Forwarded-For $proxy_add_x_forwarded_for;

 proxy_set_header

 X-Forwarded-Proto $scheme;

 proxy_set_header

 HostShost;

 proxy_pass http://tomcatServers;

 H
