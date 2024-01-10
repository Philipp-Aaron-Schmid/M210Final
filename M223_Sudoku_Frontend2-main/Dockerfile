# Stage 1: Build the application
# Use a Node.js image to build the application
FROM node:latest as build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock if you use Yarn)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the application
RUN npm run build

# Stage 2: Serve the application
# Use a lightweight server, like nginx, to serve the built files
FROM nginx:alpine

# Copy the build directory from the build stage to the server's root
COPY --from=build /app/dist /usr/share/nginx/html

# Expose the port the server listens on
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]

