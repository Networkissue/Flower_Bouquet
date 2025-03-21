# Use the official nginx image as the base image
FROM nginx:latest

# Remove the default nginx html files
RUN rm -rf /usr/share/nginx/html/*

# Copy the static website files to the nginx web server directory
COPY . /usr/share/ngnix/html

#copy all files into targetdir
COPY . .

#Expose port 80 to allow web traffic
EXPOSE 80

# Start the nginx server
CMD [ "nginx", "-g", "daemon off;" ]

