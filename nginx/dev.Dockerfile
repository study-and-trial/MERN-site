FROM nginx:1.25.5-alpine

COPY ./conf.dev.d/ /etc/nginx/conf.d/
