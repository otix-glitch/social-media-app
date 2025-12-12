# Quick Setup Guide

## Prerequisites
Make sure you have **Node.js** and **npm** installed on your system.

### Check if installed:
```bash
node --version
npm --version
```

If not installed, download from: https://nodejs.org/ (LTS version recommended)

## Installation Steps

### 1. Backend Setup

```bash
# Navigate to backend folder
cd backend

# Install dependencies
npm install

# Create .env file (copy from .env.example and update values)
cp .env.example .env

# Start the server
npm run dev
```

The backend will run on `http://localhost:5000`

### 2. Frontend Setup (Open a new terminal)

```bash
# Navigate to frontend folder
cd frontend

# Install dependencies
npm install

# Create .env file (copy from .env.example)
cp .env.example .env

# Start the development server
npm start
```

The frontend will open at `http://localhost:3000`

## Environment Variables

### Backend (.env)
```
MONGODB_URI=mongodb://localhost:27017/social-media
JWT_SECRET=your_super_secret_jwt_key
PORT=5000
```

### Frontend (.env)
```
REACT_APP_API_URL=http://localhost:5000/api
```

## Database Setup

### Option 1: Local MongoDB
Install MongoDB Community Edition from https://www.mongodb.com/try/download/community

Start the server:
```bash
mongod
```

### Option 2: MongoDB Atlas (Cloud)
1. Create account at https://www.mongodb.com/cloud/atlas
2. Create a free cluster
3. Get connection string
4. Update `MONGODB_URI` in backend `.env`

## Troubleshooting

### Port already in use?
```bash
# Windows - kill process on port 5000
netstat -ano | findstr :5000
taskkill /PID <PID> /F

# macOS/Linux
lsof -i :5000
kill -9 <PID>
```

### MongoDB connection error?
- Ensure MongoDB is running
- Check connection string in `.env`
- Verify firewall settings

### Node modules issues?
```bash
# Clear and reinstall
rm -rf node_modules package-lock.json
npm install
```

## Running in Production

### Build backend:
```bash
cd backend
npm run build
npm start
```

### Build frontend:
```bash
cd frontend
npm run build
```

## API Testing

Use Postman, Insomnia, or curl to test the API endpoints. See BACKEND.md for all available endpoints.

---

For more information, see README.md
