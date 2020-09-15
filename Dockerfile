
# Build Phase
FROM antora/antora
WORKDIR /doc/
RUN yarn global add asciidoc-link-check
RUN yarn global add antora-site-generator-lunr
COPY . .
RUN ls /doc
RUN DOCSEARCH_ENABLED=true DOCSEARCH_ENGINE=lunr NODE_PATH="$(npm -g root)" antora --generator antora-site-generator-lunr playbook.yml


# Publish Phase
FROM nginx
LABEL version="1.0"
LABEL description="The Reactive Principals"

COPY --from=0 /doc/build/site /usr/share/nginx/html
EXPOSE 80/tcp