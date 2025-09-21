FROM node:20-alpine
WORKDIR /app

# Instala dependências
COPY package*.json ./
RUN npm ci --omit=dev

# Copia código
COPY . .

# Env e porta
ENV NODE_ENV=production
EXPOSE 8080

# Logs sem buffer (melhor no CloudWatch)
ENV NODE_OPTIONS=--enable-source-maps
CMD ["node", "server.js"]