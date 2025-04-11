# # Use the official nginx image as the base image
# FROM nginx:latest

# # Remove the default nginx html files
# RUN rm -rf /usr/share/nginx/html/*

# COPY ./Flower-bouquet-webpage-main/flower-web.html /usr/share/nginx/html/
# COPY ./Flower-bouquet-webpage-main/web-flower.css /usr/share/nginx/html/

# # Copy the static website files to the nginx web server directory
# COPY . /usr/share/nginx/html/



# # Expose port 80 to allow web traffic
# EXPOSE 8080

# # Start the nginx server
# CMD ["nginx", "-g", "daemon off;"]

# Use the official nginx image
FROM nginx:latest

# Remove default files
RUN rm -rf /usr/share/nginx/html/*

# Copy your static files
COPY ./Flower-bouquet-webpage-main/flower-web.html /usr/share/nginx/html/index.html
COPY ./Flower-bouquet-webpage-main/web-flower.css /usr/share/nginx/html/

# Change nginx to listen on port 8080
RUN sed -i 's/listen       80;/listen       8080;/' /etc/nginx/conf.d/default.conf

# Expose 8080 instead of 80
EXPOSE 8080

# Run nginx
CMD ["nginx", "-g", "daemon off;"]


