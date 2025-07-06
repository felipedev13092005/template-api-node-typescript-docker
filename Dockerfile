FROM node:20

WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm && pnpm install

COPY . .

# Compila el código TypeScript a JavaScript
RUN pnpm build

# Ejecuta el archivo compilado
CMD ["pnpm", "start"]
