# Use nginx to serve static files
FROM nginx:alpine

# Copy website files
COPY app/ /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
