# API Testing Exercise

## 📋 Overview

This project demonstrates API testing using **Postman Collections** and **Newman** for automated testing. The project includes test cases for user authentication, account management, and password change functionality for the Practice Software Testing application.

The source code of website is located at https://github.com/testsmith-io/practice-software-testing/
you should install it as local host

## 🧪 Test Scenarios

### API Endpoints Tested

- **Login to Account** - User authentication with different credentials
- **Get User Information** - Retrieve authenticated user details
- **Change Password** - Update user password with validation
- **Login with Old Password** - Verify old password is invalidated
- **Login with New Password** - Confirm new password works

### Test Data Categories

The project tests both **positive** and **negative** scenarios:

#### ✅ Valid Test Cases

- Admin account login (`admin@practicesoftwaretesting.com`)
- Customer account login (`customer@practicesoftwaretesting.com`)
- Customer2 account login (`customer2@practicesoftwaretesting.com`)
- Email with leading/trailing spaces handling

#### ❌ Invalid Test Cases

- Incorrect password attempts
- Non-existent account login attempts
- Invalid credentials testing

## 🗂️ Project Structure

```
API-Testing-Exercise/
├── .github/
│   └── workflows/
│       └── main.yml                 # GitHub Actions workflow
├── API Testing.postman_collection.json  # Postman collection
├── login.json                       # Test data file
└── README.md                        # This file
```

## 🚀 Getting Started

### Prerequisites

- [Node.js](https://nodejs.org/) (v18 or higher)
- [Newman](https://www.npmjs.com/package/newman) - Postman's CLI runner
- [Postman](https://www.postman.com/) (optional, for GUI testing)

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/tgkhang/API-Testing-Exercise.git
   cd API-Testing-Exercise
   ```

2. **Install Newman globally**
   ```bash
   npm install -g newman
   ```

## 🏃‍♂️ Running Tests

### Local Testing with Newman

**Run all tests with data iterations:**

**For Windows (PowerShell):**

```powershell
newman run "API Testing.postman_collection.json" `
  --iteration-data "login.json"
```

**Single line (any platform):**

```bash
newman run "API Testing.postman_collection.json" --iteration-data "login.json"
```

**Run with detailed output:**

**For local testing:**

```powershell
newman run "API Testing.postman_collection.json" `
  --iteration-data "login.json"
```

### Testing with Postman GUI

1. Import `API Testing.postman_collection.json` into Postman
2. Import `login.json` as test data
3. Run the collection with the data file

## 🤖 Automated Testing

### GitHub Actions CI/CD

The project includes automated testing via GitHub Actions that:

- ✅ Triggers on every push to the repository
- ✅ Sets up Node.js 18 environment
- ✅ Installs Newman CLI runner
- ✅ Executes all test scenarios with data iterations
- ✅ Generates JSON test reports
- ✅ Uploads test artifacts for download

## 📊 Test Reports

### Newman CLI Output

- **Execution Summary**: Shows passed/failed test counts
- **Detailed Results**: Individual test case results
- **Performance Metrics**: Response times and data transfer
- **Error Details**: Specific failure information

### Generated Artifacts

- `newman-report.json` - Machine-readable test results
- Available for download from GitHub Actions runs

## 🧪 Test Data Structure

The `login.json` file contains test iterations with:

```json
{
  "email": "user@example.com",
  "password": "password123",
  "type": "valid|invalid",
  "description": "Test case description",
  "newPassword": "newPassword123",
  "newPasswordConfirmation": "newPassword123"
}
```

## 👨‍💻 Author

**tgkhang** - [GitHub Profile](https://github.com/tgkhang)
