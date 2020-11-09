FROM nginx:mainline-alpine
RUN rm /etc/nginx/conf.d/*
COPY nginx-hello/hello.conf /etc/nginx/conf.d/
COPY nginx-hello/index.html /usr/share/nginx/html/
RUN chmod 777 -R /usr/share/nginx/html
