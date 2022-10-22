FROM node:latest

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package*.json ./

RUN npm -g install npm@6.14.14

COPY . .
EXPOSE 8080
CMD ["npm","start"]
