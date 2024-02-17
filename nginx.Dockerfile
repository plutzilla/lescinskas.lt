FROM nginx:1.25.3

COPY ./_site /usr/share/nginx/html
