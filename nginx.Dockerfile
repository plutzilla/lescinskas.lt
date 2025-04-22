FROM nginx:1.27.5

COPY ./_site /usr/share/nginx/html
