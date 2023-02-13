# Use an official Nginx runtime as the base image
FROM nginx:1.19

# Copy the default Nginx configuration file to the container
COPY default.conf /etc/nginx/conf.d/

# Use an official Node.js runtime as the base image for the React app
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json to the container
COPY package*.json ./

# Install the project dependencies
RUN npm install

# Copy the rest of the project files to the container
COPY . .

# Specify the command to run when the container starts
CMD [ "npm", "start" ]

# Expose the port for the React app to listen on
EXPOSE 3000
