# Use Nginx as a lightweight web server
FROM nginx:alpine

# Copy website files to Nginx's HTML directory
COPY Weather-main /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
