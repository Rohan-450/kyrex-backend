FROM node:20-alpine

WORKDIR /app

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application
COPY . .

# Make sure we have the environment variables
ENV NODE_ENV=production

# Start the application
CMD ["npm", "run", "dev"]