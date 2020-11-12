FROM node:alpine as builder

# Configure image
WORKDIR '/app'
COPY package.json . 
RUN npm install
COPY . . 
RUN npm run build

# Second image
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html