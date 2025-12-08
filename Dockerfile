# Use a lightweight web server image
FROM nginx:alpine

# Remove the default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy all application files from the current directory to the Nginx html folder
COPY ./ /usr/share/nginx/html/

# Expose port 80 for the container to access
EXPOSE 80

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
