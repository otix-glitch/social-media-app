@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

color 0A
title SocialHub App - Installation

echo ====================================================
echo         SocialHub - Complete Installation
echo ====================================================
echo.

:: Check if Node.js is installed
echo Checking for Node.js...
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo Node.js not found. Attempting installation...
    echo.
    
    :: Download Node.js
    echo Downloading Node.js LTS...
    powershell -Command "Invoke-WebRequest -Uri 'https://nodejs.org/dist/v20.10.0/node-v20.10.0-x64.msi' -OutFile '%TEMP%\node-installer.msi' -UseBasicParsing"
    
    if exist "%TEMP%\node-installer.msi" (
        echo Installing Node.js...
        msiexec /i "%TEMP%\node-installer.msi" /quiet
        
        echo.
        echo Node.js installation started. Waiting for completion...
        timeout /t 60 /nobreak
        
        echo.
        echo Please close this window and open a NEW Command Prompt or PowerShell
        echo Then run this batch file again.
        echo.
        pause
        exit /b
    ) else (
        echo Failed to download Node.js!
        echo Please download and install manually from: https://nodejs.org/
        pause
        exit /b 1
    )
)

echo Node.js found!
node --version
npm --version
echo.

:: Install Backend
echo ====================================================
echo Installing Backend Dependencies...
echo ====================================================
cd /d "c:\Users\7490\OneDrive\Desktop\social media\backend"
echo.
echo Directory: %cd%
echo Running: npm install
call npm install
if %errorlevel% neq 0 (
    echo WARNING: Backend installation had errors
)
echo.

:: Create backend .env
if not exist ".env" (
    echo Creating backend\.env...
    if exist ".env.example" (
        copy .env.example .env
    )
)

:: Install Frontend
echo ====================================================
echo Installing Frontend Dependencies...
echo ====================================================
cd /d "c:\Users\7490\OneDrive\Desktop\social media\frontend"
echo.
echo Directory: %cd%
echo Running: npm install
call npm install
if %errorlevel% neq 0 (
    echo WARNING: Frontend installation had errors
)
echo.

:: Create frontend .env
if not exist ".env" (
    echo Creating frontend\.env...
    if exist ".env.example" (
        copy .env.example .env
    )
)

:: Summary
echo.
echo ====================================================
echo Installation Complete!
echo ====================================================
echo.
echo Next Steps:
echo 1. Edit backend\.env with your MongoDB connection string
echo 2. Start MongoDB
echo 3. Terminal 1: cd backend ^&^& npm run dev
echo 4. Terminal 2: cd frontend ^&^& npm start
echo.
echo Project Structure:
echo - backend/    = Node.js/Express API
echo - frontend/   = React Web App
echo.
echo Documentation:
echo - README.md        = Project overview
echo - SETUP.md         = Quick setup guide
echo - BACKEND.md       = API documentation
echo - DEVELOPMENT.md   = Development guide
echo.
pause
