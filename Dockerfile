FROM node:16-alpine

RUN apk update && \
    apk upgrade && \
    apk add --no-cache make gcc g++ python3

ENV PORT 3000

# Create app directory
RUN mkdir -p /usr/src/app/trello
WORKDIR /usr/src/app/trello

# Installing dependencies
COPY package.json /usr/src/app/trello
COPY yarn.lock /usr/src/app/trello
    
RUN yarn install

# Copying source files
COPY . /usr/src/app/trello

CMD ["yarn", "dev"]

EXPOSE 3000
