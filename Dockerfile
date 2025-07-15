FROM node:18

WORKDIR /app

# Install deps
COPY package*.json ./
RUN npm install

# Copy source and build
COPY . .
RUN npm run build

# Install static server
RUN npm install -g serve

EXPOSE 8080

# Serve the dist folder
CMD ["serve", "-s", "dist", "-l", "8080"]
