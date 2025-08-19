FROM nginx:1.29.1

COPY ./_site /usr/share/nginx/html
