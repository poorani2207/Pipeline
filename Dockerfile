# Use a lightweight web server image
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy your application files into nginx folder
COPY . /usr/share/nginx/html/

# Expose nginx port
EXPOSE 80

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
