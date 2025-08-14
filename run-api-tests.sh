#!/bin/bash

echo "🚀 Starting API Login Tests..."

# Start Docker services
echo "📦 Starting Docker containers..."
# docker-compose up -d
docker compose -f docker-compose.yml up -d --force-recreate

# Wait for services
echo "⏳ Waiting for services to be ready..."
sleep 30

# Setup database
echo "🗄️ Setting up database..."
docker compose exec laravel-api php artisan migrate --force
docker compose exec laravel-api php artisan db:seed --force

# Install Newman if not exists
if ! command -v newman &> /dev/null; then
    echo "📥 Installing Newman..."
    npm install -g newman newman-reporter-htmlextra
fi

# Run tests
# TODO (Bạn thêm code ở dưới đây)

# Cleanup (optional)
docker compose down
