# Build Phase
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Run phase via nginx
FROM nginx

#Expose port 80 (This is only for Elasticbeanstalk not for local machine)
EXPOSE 80
#In this step we are just copying the build content from build phase to run phase in nginx
COPY --from=0 /app/build /usr/share/nginx/html