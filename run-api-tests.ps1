Write-Host "Starting API Tests..."

# Check if Newman is installed
if (-not (Get-Command newman -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Newman..."
    npm install -g newman
}

# Run tests
Write-Host "Running API tests..."
newman run "tests/api/API Testing.postman_collection.json" --iteration-data "tests/api/login.json"
