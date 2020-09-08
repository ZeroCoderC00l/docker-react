#Build Phase.
FROM node:alpine AS builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Run Phase. No need to start Nginx, default command is to bring the server up.
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
