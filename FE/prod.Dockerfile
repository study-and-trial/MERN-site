# Stage 1: Build the application
FROM node:22-alpine as build
WORKDIR /app

RUN npm install -g pnpm
COPY package.json pnpm-lock.yaml ./
RUN pnpm install

COPY . .
RUN pnpm run build

### Stage 2: Deploy with built only
FROM node:latest
RUN npm install -g serve
COPY --from=build /app/dist dist
CMD serve -s dist -l 3000
