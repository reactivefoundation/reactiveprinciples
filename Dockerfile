
# FROM antora/antora
# Need the build phase here
FROM nginx
LABEL version="1.0"
LABEL description="The Reactive Principals"

COPY build/site /usr/share/nginx/html
EXPOSE 80/tcp