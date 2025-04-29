FROM nginx:1.28.0

COPY ./_site /usr/share/nginx/html
