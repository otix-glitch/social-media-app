# Node.js Installation Instructions

Since the automated installation didn't work, please follow these manual steps:

## Windows Installation (Manual)

### Option 1: Using Installer (Easiest)

1. **Download Node.js**
   - Go to https://nodejs.org/
   - Click on "LTS" (Long Term Support) version
   - Download the Windows x64 Installer (.msi file)

2. **Run the Installer**
   - Double-click the downloaded .msi file
   - Click "Next" through all screens
   - Keep default settings
   - Click "Install"
   - Click "Finish"

3. **Verify Installation**
   - Open a new PowerShell window (important: must be NEW window)
   - Type: `node --version`
   - Type: `npm --version`
   - You should see version numbers

### Option 2: Using Chocolatey (If installed)

```powershell
choco install nodejs
```

### Option 3: Using Windows Package Manager

```powershell
winget install OpenJS.NodeJS
```

## After Installation

Once Node.js is installed and verified, run this in PowerShell:

```powershell
# Navigate to project
cd "C:\Users\7490\OneDrive\Desktop\social media"

# Install backend
cd backend
npm install

# Install frontend
cd ..\frontend
npm install
```

## Create .env Files

### Backend .env
Create file at: `backend/.env`
```
MONGODB_URI=mongodb://localhost:27017/social-media
JWT_SECRET=your_super_secret_jwt_key_change_this
PORT=5000
NODE_ENV=development
```

### Frontend .env
Create file at: `frontend/.env`
```
REACT_APP_API_URL=http://localhost:5000/api
```

## Start the App

In PowerShell Terminal 1:
```powershell
cd backend
npm run dev
```

In PowerShell Terminal 2:
```powershell
cd frontend
npm start
```

## Troubleshooting

If `npm` is still not recognized after installation:
- Restart your entire computer
- Open a NEW PowerShell window
- Try again

If issues persist:
- Go to Settings → System → About → Advanced system settings
- Click "Environment Variables"
- Verify "C:\Program Files\nodejs" is in PATH
- Click OK and restart PowerShell
