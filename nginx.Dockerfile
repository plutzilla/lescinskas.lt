FROM nginx:1.29.2

COPY ./_site /usr/share/nginx/html
