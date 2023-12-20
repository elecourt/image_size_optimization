FROM node:alpine AS build-stage
FROM nginx:alpine

WORKDIR /app

COPY package*.json ./
COPY --from=build-stage /app/dist /usr/share/nginx/html

RUN npm install

COPY . .

RUN npm run build

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]