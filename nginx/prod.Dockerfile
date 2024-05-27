FROM nginx:1.25.5-alpine

COPY ./conf.prod.d/ /etc/nginx/conf.d/
