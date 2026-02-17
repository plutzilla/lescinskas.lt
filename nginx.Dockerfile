FROM nginx:1.29.5

COPY ./_site /usr/share/nginx/html
