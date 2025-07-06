# 🧪 Template API Node + TypeScript + Docker + MySQL

## Este es un proyecto base para construir APIs usando Node.js, Express y TypeScript, completamente dockerizado y conectado a una base de datos MySQL.

## 🚀 Tecnologías

- Node.js 20
- Express
- TypeScript
- MySQL 8
- Docker + Docker Compose
- pnpm

---

## ⚙️ Requisitos

Antes de comenzar, asegúrate de tener instalado:

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [pnpm](https://pnpm.io/) (opcional, si vas a trabajar fuera de Docker)

---

## 🧰 Inicializar el proyecto desde cero

1. **Clona el repositorio:**

   ```bash
   git clone git@github.com:felipedev13092005/template-api-node-typescript-docker.git
   docker compose up --buildcd template-api-node-typescript-docker
   ```

2. **Crea el archivo .env:**

Puedes crear el archivo manualmente con las siguientes variables:

```env
PORT=3000
DB_HOST=db
DB_PORT=3306
DB_USER=root
DB_PASSWORD=password
DB_NAME=testdb
```

3. **Inicializa el proyecto con Docker:**

```bash
docker compose up --build
```

Esto ejecutará lo siguiente:

- Instala dependencias con pnpm install
- Compila el código TypeScript (pnpm build)
- Levanta el contenedor de MySQL
- Ejecuta el archivo compilado (dist/app.js) con pnpm start

4. **Verifica que la API esté funcionando:**

Abre en el navegador o usa curl:

```bash
curl http://localhost:3000/
```

Si todo está bien, deberías obtener una respuesta similar a:

```bash
[{"time": "2025-07-06T20:00:00.000Z"}]
```

## 🧑‍💻 Desarrollo local con Docker solo para MySQL

Si prefieres ejecutar tu código localmente (usando pnpm dev) y usar Docker solo para la base de datos, puedes hacerlo con docker-compose-dev.yml.

1. **Levanta solo MySQL con Docker**

```bash
   docker compose -f docker-compose-dev.yml up -d

```

Esto iniciará solo el contenedor de MySQL en segundo plano.

2. **Ajusta tu .env para desarrollo local**
   Usa estos valores para conectarte desde tu máquina al contenedor de MySQL:

```env
DB_HOST=127.0.0.1
DB_PORT=3306
DB_USER=root
DB_PASSWORD=password
DB_NAME=testdb
PORT=3000
```

Usa 127.0.0.1 en lugar de localhost si tienes problemas desde WSL o Linux.

3. **Corre tu app localmente**

```bash
   pnpm install
   pnpm dev
```

Tu código se ejecutará localmente con nodemon + ts-node, mientras usa la base de datos en Docker.

4. **Apagar el contenedor MySQL cuando termines**

```bash
   docker compose -f docker-compose-dev.yml down
```
