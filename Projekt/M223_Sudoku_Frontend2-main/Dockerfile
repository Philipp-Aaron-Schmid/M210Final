# Stage 1: Build the application
# Use a Node.js image to build the application
FROM node:18-alpine3.17 as build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock if you use Yarn)
COPY . /app

# Install dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the application
RUN npm run build

# Stage 2: Serve the application
RUN apk update
RUN apk add nginx

# Copy the build directory from the build stage to the server's root
RUN cp -r /app/dist/* /var/lib/nginx/html/

# Expose the port the server listens on
EXPOSE 80

# Copy conf file to avoid https
COPY ./nginx.conf /etc/nginx/http.d/default.conf

# Start nginx
CMD ["nginx", "-g", "daemon off;"]

