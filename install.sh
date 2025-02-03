#!/bin/bash

# Exit on errors
set -e

echo "🚀 Setting up react-express-serverless backend..."

# Install frontend dependencies
echo "📦 Installing frontend dependencies..."
cd client
npm install

# Install backend dependencies
echo "📦 Installing backend dependencies..."
cd ../server
npm install

# Create .env file if it doesn't exist
if [ ! -f ".env" ]; then
  echo "🔹 Creating .env file..."
  cat <<EOL > .env
# Environment Variables for Express Server
PORT=5000
MONGODB_URI=mongodb+srv://your-username:your-password@your-cluster.mongodb.net/your-db?retryWrites=true&w=majority
JWT_SECRET=your-secret-key
NODE_ENV=development
CORS_ORIGIN=http://localhost:5173
EOL
  echo "✅ .env file created successfully!"
else
  echo "⚠️ .env file already exists. Skipping..."
fi

# Return to root directory
cd ..

echo "✅ Installation complete!"
echo "🚀 To start the project:"

echo "🔹 Run 'cd client && npm run dev' to start the frontend."
echo "🔹 Run 'cd server && npm run dev' to start the backend."
