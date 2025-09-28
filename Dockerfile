# Use official Node.js 16 LTS image as the base image
# This provides Node.js and npm in a lightweight Linux image
FROM node:16

# Create and set the working directory inside the container
# All subsequent commands will run in /usr/src/app
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if present) so npm can install dependencies
# Using this layer separately allows Docker to cache npm install between builds
COPY package*.json ./

# Install dependencies defined in package.json
# We use npm install; in production builds you may choose --production to skip devDeps
RUN npm install

# Copy the rest of the application source code into the container
COPY . .

# Expose port 3000 so the container can be reached on that port from the host
EXPOSE 3000

# Default command to start the application
# This runs `npm start` which is defined in package.json and starts app.js
CMD ["npm", "start"]
