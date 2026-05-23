FROM node:26.2-alpine
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN npm run build

CMD ["node", ".output/server/index.mjs"]
