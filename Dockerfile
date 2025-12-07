# Use a lightweight web server image; replace with your base if node/python, etc.
FROM nginx:alpine

# Copy app into nginx html directory (adjust for your app)
COPY src/ /usr/share/nginx/html/

EXPOSE <APP_PORT>

CMD ["nginx", "-g", "daemon off;"]
