FROM nginx:alpine

COPY index.html /usr/share/nginx/html/index.html
COPY 404.html /usr/share/nginx/html/404.html

RUN printf 'server {\n\
    listen 80;\n\
    server_name _;\n\
    root /usr/share/nginx/html;\n\
    index index.html;\n\
\n\
    location / {\n\
        try_files $uri $uri/ /404.html;\n\
    }\n\
}\n' > /etc/nginx/conf.d/default.conf
