FROM nginx:1.30.4

COPY ./_site /usr/share/nginx/html
