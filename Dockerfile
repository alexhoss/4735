FROM node:10-alpine
RUN apk add --update make
WORKDIR /app
COPY package.json .
RUN npm install
COPY main.js .
CMD ["node", "main.js"]

LABEL maintainer "ahosseini7@my.bcit.ca"


HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:3000 || exit 1

EXPOSE 3000 
