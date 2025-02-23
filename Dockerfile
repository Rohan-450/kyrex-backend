FROM node:18-alpine

WORKDIR /app

# Copy package files first
COPY package.json pnpm-lock.yaml ./

# Install pnpm
RUN npm install -g pnpm

# Clean install dependencies
RUN pnpm install --frozen-lockfile

# Copy the rest of the application
COPY . .

# Start the application
CMD ["pnpm", "run", "start"]