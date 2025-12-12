@echo off
REM Social Media App - Automatic Installation Script

echo ============================================
echo Social Media App - Installation Script
echo ============================================
echo.

REM Check if Node.js is installed
echo Checking for Node.js installation...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Node.js not found. Downloading Node.js LTS...
    powershell -Command "Invoke-WebRequest -Uri 'https://nodejs.org/dist/v20.10.0/node-v20.10.0-x64.msi' -OutFile '%TEMP%\node-installer.msi'; Start-Process -FilePath '%TEMP%\node-installer.msi' -ArgumentList '/quiet' -Wait"
    echo.
    echo Please restart your terminal and run this script again.
    pause
    exit /b
) else (
    echo Node.js found: 
    node --version
    npm --version
)

echo.
echo ============================================
echo Installing Backend Dependencies
echo ============================================
echo.

cd /d "c:\Users\7490\OneDrive\Desktop\social media\backend"
echo Current directory: %cd%
echo Installing npm packages...
call npm install

if %errorlevel% neq 0 (
    echo Failed to install backend dependencies!
    pause
    exit /b 1
)

echo Backend installation completed!
echo.

REM Create .env file if it doesn't exist
if not exist ".env" (
    echo Creating .env file...
    copy .env.example .env
    echo Please edit .env with your MongoDB URI and JWT secret
)

echo.
echo ============================================
echo Installing Frontend Dependencies
echo ============================================
echo.

cd /d "c:\Users\7490\OneDrive\Desktop\social media\frontend"
echo Current directory: %cd%
echo Installing npm packages...
call npm install

if %errorlevel% neq 0 (
    echo Failed to install frontend dependencies!
    pause
    exit /b 1
)

echo Frontend installation completed!
echo.

REM Create .env file if it doesn't exist
if not exist ".env" (
    echo Creating .env file...
    copy .env.example .env
)

echo.
echo ============================================
echo Installation Complete!
echo ============================================
echo.
echo Next steps:
echo 1. Edit backend\.env with your MongoDB URI
echo 2. Edit frontend\.env if needed
echo 3. Start MongoDB
echo 4. Run: npm run dev (in backend directory)
echo 5. Run: npm start (in frontend directory)
echo.
pause
