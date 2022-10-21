FROM node:latest
RUN mkdir -p /src/app
WORKDIR /src/app
COPY package*.json ./
RUN npm -g install npm@6.14.14
COPY . .
CMD ["npm","start"]
