FROM nginx:1.25.4

COPY ./_site /usr/share/nginx/html
