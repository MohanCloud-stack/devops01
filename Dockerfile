FROM node:latest
RUN mkdir -p /src/app
WORKDIR /src/app
COPY package*.json ./
RUN npm -g install npm@6.14.14
RUN npm install
COPY . .
CMD ["npm","start"]
