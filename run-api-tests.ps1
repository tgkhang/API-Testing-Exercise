Write-Host "🚀 Starting API Login Tests..."

# Start Docker services
Write-Host "📦 Starting Docker containers..."
docker compose -f docker-compose.yml up -d --force-recreate

# Wait for services
Write-Host "⏳ Waiting for services to be ready..."
Start-Sleep -Seconds 30

# Setup database
Write-Host "🗄️ Setting up database..."
docker compose exec laravel-api php artisan migrate --force
docker compose exec laravel-api php artisan db:seed --force

# Check if Newman is installed
if (-not (Get-Command newman -ErrorAction SilentlyContinue)) {
    Write-Host "📥 Installing Newman..."
    npm install -g newman newman-reporter-htmlextra
}

# Run tests
Write-Host "🧪 Running API tests..."
newman run "tests/api/API Testing.postman_collection.json" --iteration-data "tests/api/login.json" --reporters cli,json --reporter-json-export newman-report.json

# Cleanup
Write-Host "🧹 Stopping Docker containers..."
docker compose down