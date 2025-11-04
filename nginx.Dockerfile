FROM nginx:1.29.3

COPY ./_site /usr/share/nginx/html
