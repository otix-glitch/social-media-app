# SocialHub App - Complete Installation Script
# Run this with: powershell -ExecutionPolicy Bypass -File setup.ps1

Write-Host "=================================" -ForegroundColor Cyan
Write-Host "SocialHub - Complete Setup Script" -ForegroundColor Cyan
Write-Host "=================================" -ForegroundColor Cyan
Write-Host ""

# Check if running as admin
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (-not $isAdmin) {
    Write-Host "This script should ideally run as Administrator for Node.js installation." -ForegroundColor Yellow
    Write-Host "Continuing anyway..." -ForegroundColor Yellow
    Write-Host ""
}

# Check if Node.js is installed
Write-Host "Step 1: Checking for Node.js..." -ForegroundColor Green
$nodeInstalled = $false
try {
    $nodeVersion = & node --version 2>$null
    $npmVersion = & npm --version 2>$null
    if ($nodeVersion -and $npmVersion) {
        Write-Host "✓ Node.js is installed: $nodeVersion" -ForegroundColor Green
        Write-Host "✓ npm is installed: v$npmVersion" -ForegroundColor Green
        $nodeInstalled = $true
    }
} catch {
    Write-Host "✗ Node.js not found in system PATH" -ForegroundColor Red
}

# If Node.js not installed, download and install
if (-not $nodeInstalled) {
    Write-Host ""
    Write-Host "Step 2: Installing Node.js LTS..." -ForegroundColor Green
    
    $downloadPath = "$env:TEMP\node-installer.msi"
    $nodeUrl = "https://nodejs.org/dist/v20.10.0/node-v20.10.0-x64.msi"
    
    Write-Host "Downloading from: $nodeUrl" -ForegroundColor Yellow
    try {
        Invoke-WebRequest -Uri $nodeUrl -OutFile $downloadPath -UseBasicParsing
        Write-Host "✓ Download completed: $downloadPath" -ForegroundColor Green
    } catch {
        Write-Host "✗ Failed to download Node.js: $_" -ForegroundColor Red
        Write-Host ""
        Write-Host "Please download manually from: https://nodejs.org/" -ForegroundColor Yellow
        Read-Host "Press Enter after installing Node.js, then run this script again"
        exit 1
    }
    
    Write-Host "Installing Node.js..." -ForegroundColor Yellow
    try {
        Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$downloadPath`" /quiet" -Wait
        Write-Host "✓ Node.js installation completed" -ForegroundColor Green
    } catch {
        Write-Host "✗ Installation failed: $_" -ForegroundColor Red
        exit 1
    }
    
    Write-Host ""
    Write-Host "NOTE: You must restart PowerShell for changes to take effect!" -ForegroundColor Yellow
    Write-Host "Close this window and open a new PowerShell, then run this script again." -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 0
}

# Navigate to project root
Write-Host ""
Write-Host "Step 3: Installing Backend Dependencies..." -ForegroundColor Green
$projectRoot = "C:\Users\7490\OneDrive\Desktop\social media"
$backendDir = Join-Path $projectRoot "backend"
$frontendDir = Join-Path $projectRoot "frontend"

Set-Location $backendDir
Write-Host "Backend directory: $backendDir" -ForegroundColor Yellow

try {
    Write-Host "Running: npm install" -ForegroundColor Yellow
    & npm install 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Backend dependencies installed successfully" -ForegroundColor Green
    } else {
        Write-Host "✗ npm install failed with exit code: $LASTEXITCODE" -ForegroundColor Red
        Read-Host "Press Enter to continue with frontend installation"
    }
} catch {
    Write-Host "✗ Error running npm install: $_" -ForegroundColor Red
    Read-Host "Press Enter to continue"
}

# Create backend .env if it doesn't exist
if (-not (Test-Path "$backendDir\.env")) {
    Write-Host "Creating backend .env file..." -ForegroundColor Yellow
    Copy-Item "$backendDir\.env.example" "$backendDir\.env"
    Write-Host "✓ .env file created at $backendDir\.env" -ForegroundColor Green
} else {
    Write-Host "✓ backend\.env already exists" -ForegroundColor Green
}

# Install frontend dependencies
Write-Host ""
Write-Host "Step 4: Installing Frontend Dependencies..." -ForegroundColor Green
Set-Location $frontendDir
Write-Host "Frontend directory: $frontendDir" -ForegroundColor Yellow

try {
    Write-Host "Running: npm install" -ForegroundColor Yellow
    & npm install 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Frontend dependencies installed successfully" -ForegroundColor Green
    } else {
        Write-Host "✗ npm install failed with exit code: $LASTEXITCODE" -ForegroundColor Red
    }
} catch {
    Write-Host "✗ Error running npm install: $_" -ForegroundColor Red
}

# Create frontend .env if it doesn't exist
if (-not (Test-Path "$frontendDir\.env")) {
    Write-Host "Creating frontend .env file..." -ForegroundColor Yellow
    Copy-Item "$frontendDir\.env.example" "$frontendDir\.env"
    Write-Host "✓ .env file created at $frontendDir\.env" -ForegroundColor Green
} else {
    Write-Host "✓ frontend\.env already exists" -ForegroundColor Green
}

# Summary
Write-Host ""
Write-Host "=================================" -ForegroundColor Green
Write-Host "Installation Complete!" -ForegroundColor Green
Write-Host "=================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Cyan
Write-Host "1. Edit backend\.env with your MongoDB connection string" -ForegroundColor Yellow
Write-Host "2. Ensure MongoDB is running" -ForegroundColor Yellow
Write-Host "3. Start backend: cd backend; npm run dev" -ForegroundColor Yellow
Write-Host "4. Start frontend: cd frontend; npm start" -ForegroundColor Yellow
Write-Host ""
Write-Host "Documentation:" -ForegroundColor Cyan
Write-Host "- README.md - Project overview" -ForegroundColor Yellow
Write-Host "- SETUP.md - Quick setup guide" -ForegroundColor Yellow
Write-Host "- BACKEND.md - API documentation" -ForegroundColor Yellow
Write-Host "- DEVELOPMENT.md - Development guide" -ForegroundColor Yellow
Write-Host ""

Read-Host "Press Enter to exit"
