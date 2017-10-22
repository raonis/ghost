FROM nginx:latest
MAINTAINER Raoni Sortica <raoni@raoni.adm.br>

COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY nginx/certs/fullchain.pem /etc/nginx/certs/fullchain.pem
COPY nginx/certs/privkey.pem /etc/nginx/certs/privkey.pem
