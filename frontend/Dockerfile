# билд фронтенда с использованием Node.js и Nginx
FROM node:8 AS builder

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json для установки зависимостей
COPY package*.json .

# Устанавливаем зависимости
RUN npm install 

# Копируем остальные файлы приложения
COPY . .

# Собираем фронтенд приложение
RUN npm run build 

# Используем Nginx для запуска фронтенда
FROM nginx:1.27

# Удаляем стандартный контент Nginx
RUN rm -rf /usr/share/nginx/html 

# Создаем директорию для хранения статических файлов
RUN mkdir -p /usr/share/nginx/html

# Копируем собранные файлы из билдера в Nginx
COPY --from=builder /app/dist/frontend/ /usr/share/nginx/html

EXPOSE 80

# Запускаем nginx в режиме демона
CMD ["nginx", "-g", "daemon off;"]