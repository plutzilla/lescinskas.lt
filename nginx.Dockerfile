FROM nginx:1.29.0

COPY ./_site /usr/share/nginx/html
