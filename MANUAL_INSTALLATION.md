# Installation Failed - Manual Setup Required

Unfortunately, the automated Node.js installation didn't complete successfully. Please follow these manual steps:

## Step 1: Install Node.js (Required)

### Method A: Using Installer (Recommended)

1. **Download Node.js**
   - Open browser and go to: https://nodejs.org/
   - Click the large "LTS" button (currently v20.10.0 or latest LTS)
   - Choose Windows Installer (.msi)
   - Select 64-bit (unless you have 32-bit Windows)

2. **Run the Installer**
   - Double-click the downloaded file (node-v20.x.x-x64.msi)
   - Click "Next" through all the screens
   - Accept the license agreement
   - Keep default installation path: `C:\Program Files\nodejs`
   - Click "Install"
   - Click "Finish"

3. **Verify Installation**
   - Close ALL PowerShell/Command Prompt windows
   - Open a NEW PowerShell window (this is important!)
   - Type: `node --version` (should show: v20.10.0 or similar)
   - Type: `npm --version` (should show: 10.x.x or similar)

### Method B: Using Chocolatey (If you have it installed)

```powershell
choco install nodejs
```

### Method C: Using Windows Package Manager

```powershell
winget install OpenJS.NodeJS
```

## Step 2: Verify You're in the Right Directory

```powershell
cd "C:\Users\7490\OneDrive\Desktop\social media"
ls
```

You should see folders: `backend`, `frontend`, and files like `README.md`, `setup.ps1`, etc.

## Step 3: Install Backend Dependencies

```powershell
cd backend
npm install
```

This will take 2-5 minutes. You'll see lots of text scrolling - this is normal.

## Step 4: Create Backend .env File

```powershell
# Still in backend folder
copy .env.example .env
```

Edit the `.env` file:
- If using local MongoDB: Keep `MONGODB_URI=mongodb://localhost:27017/social-media`
- If using MongoDB Atlas (cloud), replace with your connection string
- You can change `JWT_SECRET` to anything random (it's just for development)

## Step 5: Install Frontend Dependencies

```powershell
cd ..\frontend
npm install
```

This will also take 2-5 minutes.

## Step 6: Create Frontend .env File

```powershell
# Still in frontend folder
copy .env.example .env
```

You can leave it as-is for local development.

## Step 7: Setup MongoDB

### Option A: Local MongoDB (Requires installation)

Download from: https://www.mongodb.com/try/download/community

After installation, MongoDB will run as a service automatically.

### Option B: MongoDB Atlas (Cloud - Easier)

1. Go to https://www.mongodb.com/cloud/atlas
2. Create a free account
3. Create a free cluster
4. Get the connection string (looks like: `mongodb+srv://username:password@cluster.mongodb.net/social-media`)
5. Update `backend/.env` with this connection string

## Step 8: Start the Application

### Terminal 1 - Backend:
```powershell
cd "C:\Users\7490\OneDrive\Desktop\social media\backend"
npm run dev
```

Wait until you see: `Server running on port 5000`

### Terminal 2 - Frontend:
```powershell
cd "C:\Users\7490\OneDrive\Desktop\social media\frontend"
npm start
```

The browser will automatically open to http://localhost:3000

## Troubleshooting

### "npm: The term 'npm' is not recognized"
- Close ALL PowerShell windows
- Open a NEW PowerShell window
- Try again
- If still fails, restart your computer and try again

### "Cannot find MongoDB"
- Make sure MongoDB is running
- Check if you need to update `MONGODB_URI` in `backend/.env`
- If using MongoDB Atlas, ensure your IP is whitelisted

### "npm install" fails
- Delete `node_modules` folder and `package-lock.json`
- Run `npm cache clean --force`
- Run `npm install` again

### Port 3000 or 5000 already in use
```powershell
# Find and kill process on port 5000
netstat -ano | findstr :5000
taskkill /PID <PID> /F

# Or just use a different port
# For backend: edit .env and change PORT=5001
# For frontend: set REACT_APP_PORT=3001 before npm start
```

## File Locations

After installation, you should have:

```
social media/
├── backend/
│   ├── node_modules/          (created by npm install)
│   ├── src/
│   ├── package.json
│   ├── .env                   (you create this)
│   └── .env.example
├── frontend/
│   ├── node_modules/          (created by npm install)
│   ├── src/
│   ├── package.json
│   ├── .env                   (you create this)
│   └── .env.example
├── README.md
├── SETUP.md
└── ... other files
```

## Success Indicators

**Backend running (terminal 1):**
```
> social-media-backend@1.0.0 dev
> ts-node src/server.ts
MongoDB connected
Server running on port 5000
```

**Frontend running (terminal 2):**
```
Compiled successfully!

You can now view my-app in the browser.

  Local:            http://localhost:3000
  On Your Network:  http://192.168.x.x:3000
```

## Next Steps

Once everything is running:

1. **Create Account**: Click "Sign Up" on the app
2. **Make Posts**: Write something and click "Post"
3. **Like & Comment**: Interact with posts
4. **View Profiles**: Click on usernames to see profiles
5. **Follow Users**: Click "Follow" on profiles

## Additional Resources

- **README.md** - Full project documentation
- **BACKEND.md** - API reference and endpoints
- **DEVELOPMENT.md** - Developer guide
- **FRONTEND.md** - User guide
- **NODE_INSTALLATION.md** - More Node.js installation help

## Getting Help

If you're stuck:
1. Re-read the error message carefully
2. Check the troubleshooting section above
3. Verify Node.js is installed: `node --version`
4. Verify you're in the correct directory: `pwd`
5. Check if ports 3000 and 5000 are available

Good luck! 🚀
