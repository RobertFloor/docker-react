FROM node:alpine

# Configure image
WORKDIR '/app'
COPY package.json ./ 
RUN npm install
COPY ./ ./ 
RUN npm run build

# Second image
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html