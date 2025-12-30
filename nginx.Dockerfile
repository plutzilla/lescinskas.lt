FROM nginx:1.28.1

COPY ./_site /usr/share/nginx/html
