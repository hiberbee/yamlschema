FROM node:13-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 5000
CMD [ "node", "./node_modules/.bin/json-schema-server", "json", "-p", "5000" ]
