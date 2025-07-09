FROM node:20

WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm && pnpm install

COPY . .

# Compila el código TypeScript a JavaScript
RUN pnpm build

# Arranque condicional según NODE_ENV
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

CMD ["sh", "-c", "if [ \"$NODE_ENV\" = \"development\" ]; then pnpm dev; else pnpm start; fi"]
