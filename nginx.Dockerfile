FROM nginx:1.29.4

COPY ./_site /usr/share/nginx/html
