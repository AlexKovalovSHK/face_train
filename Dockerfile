FROM node:23-alpine3.20 AS builder

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

RUN npm run build  

FROM nginx:alpine
# Копируем файлы сборки из предыдущего шага
COPY --from=builder /app/dist /usr/share/nginx/html

# Копируем конфигурацию Nginx (при необходимости)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Открываем порт
EXPOSE 3004

# Запускаем Nginx
CMD ["nginx", "-g", "daemon off;"]
