# MongoDB Setup Guide

Your social media app is now running, but needs MongoDB to store data. You have two options:

## Option 1: Use MongoDB Atlas (Cloud - Recommended for Windows)

1. Go to https://www.mongodb.com/cloud/atlas
2. Sign up for a free account
3. Create a new cluster (it's free)
4. Click "Connect" and get your connection string
5. Copy the connection string (looks like: `mongodb+srv://username:password@cluster.mongodb.net/social-media`)
6. Edit `backend/.env` and replace the `MONGODB_URI` line with your connection string
7. Restart the backend server

Example `.env`:
```
MONGODB_URI=mongodb+srv://myusername:mypassword@cluster0.abc123.mongodb.net/social-media
JWT_SECRET=your_super_secret_jwt_key_change_this_in_production
PORT=5000
```

## Option 2: Local MongoDB (Windows)

1. Download MongoDB Community Edition from: https://www.mongodb.com/try/download/community
2. Run the installer (choose "Install as Service")
3. During installation, it will offer to install MongoDB as a Windows Service
4. After installation, MongoDB will start automatically
5. The app will connect using the default `MONGODB_URI` in `.env`

## Verify Connection

After setting up MongoDB:
1. Restart the backend server
2. Go to http://localhost:3000
3. Try creating an account - it should now work!

## Backend Terminal Output

You should see one of these messages:
- ✅ `MongoDB connected` - Everything is working
- ⚠️ `MongoDB Connection Failed!` - MongoDB is not running, follow the steps above
