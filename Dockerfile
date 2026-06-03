FROM oven/bun:1.3.14-alpine
WORKDIR /app

COPY package.json bun.lock ./
RUN bun install --frozen-lockfile

COPY . .
RUN bun run build

EXPOSE 3000/tcp
CMD ["bun", ".output/server/index.mjs"]
