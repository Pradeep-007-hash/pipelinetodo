Create a Dockerfile
# Step 1: Use Node.js image
FROM node:18

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Step 4: Copy the rest of the app
COPY . .

# Step 5: Build the React app
RUN npm run build

# Step 6: Use lightweight web server to serve files
RUN npm install -g serve

# Step 7: Command to run app
CMD ["serve", "-s", "build", "-l", "3000"]

# Expose port 3000
EXPOSE 3000



Build the Docker image
docker build -t todolist-react .



Run the container
docker run -d -p 3000:3000 todolist-react


View your app in docker

Stop the container

docker ps
docker stop <container_id>
