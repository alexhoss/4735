# use a node base image
FROM node:10

# set maintainer
LABEL maintainer "ahosseini7@my.bcit.ca"

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:3000 || exit 1

# tell docker what port to expose
EXPOSE 3000