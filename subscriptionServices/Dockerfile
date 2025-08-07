FROM node:18

WORKDIR /app

COPY package*.json ./
COPY tsconfig.json ./
COPY .env ./
RUN npm install

COPY ./src ./src

EXPOSE 3000

CMD ["npx", "ts-node-dev", "src/index.ts"]
