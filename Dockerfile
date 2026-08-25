FROM node:20-slim
RUN corepack enable && corepack prepare pnpm@9 --activate
WORKDIR /app
COPY package.json ./
RUN pnpm install
COPY . .
ENV NEXT_TELEMETRY_DISABLED=1
RUN pnpm build
EXPOSE 3000
CMD ["pnpm", "start"]
