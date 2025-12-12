# Development Guide

## Setting Up the Development Environment

### Prerequisites
- Node.js v14+
- npm or yarn
- Git
- MongoDB (local or MongoDB Atlas)
- VS Code or preferred editor

### Initial Setup

1. Clone the repository:
```bash
git clone <repo-url>
cd social-media
```

2. Set up backend:
```bash
cd backend
npm install
cp .env.example .env
# Edit .env with your MongoDB URI and JWT secret
npm run dev
```

3. In a new terminal, set up frontend:
```bash
cd frontend
npm install
cp .env.example .env
npm start
```

## Development Workflow

### Backend Development

**Hot Reload with ts-node**:
```bash
npm run dev
```

**Build for Production**:
```bash
npm run build
npm start
```

**Structure**:
- Models: Define data schemas in `src/models/`
- Controllers: Business logic in `src/controllers/`
- Routes: API endpoints in `src/routes/`
- Middleware: Auth and other middleware in `src/middleware/`

### Frontend Development

**Start Development Server**:
```bash
npm start
```

**Build for Production**:
```bash
npm run build
```

**Test**:
```bash
npm test
```

**Structure**:
- Components: Reusable UI components in `src/components/`
- Pages: Full page components in `src/pages/`
- Hooks: Custom hooks in `src/hooks/`
- Utils: Helper functions in `src/utils/`

## Adding New Features

### Example: Add a New Model

1. Create `src/models/NewModel.ts`:
```typescript
import mongoose, { Schema, Document } from 'mongoose';

export interface INewModel extends Document {
  field1: string;
  field2: number;
  createdAt: Date;
}

const newModelSchema = new Schema(
  {
    field1: { type: String, required: true },
    field2: { type: Number },
  },
  { timestamps: true }
);

export default mongoose.model<INewModel>('NewModel', newModelSchema);
```

2. Create controller in `src/controllers/newModelController.ts`

3. Create routes in `src/routes/newModelRoutes.ts`

4. Import routes in `src/server.ts`

### Example: Add a New Page

1. Create component in `src/pages/NewPage.tsx`:
```typescript
import React from 'react';

const NewPage: React.FC = () => {
  return (
    <div className="new-page">
      <h1>New Page</h1>
    </div>
  );
};

export default NewPage;
```

2. Add route in `src/App.tsx`:
```typescript
<Route path="/new-page" element={<NewPage />} />
```

3. Add navigation link in `src/components/Navigation.tsx`

## Database Schema Examples

### Running MongoDB Locally

```bash
# Using Docker
docker run -d -p 27017:27017 --name mongodb mongo

# Or using MongoDB Community Edition
mongod
```

### Using MongoDB Atlas (Cloud)

1. Create account at mongodb.com
2. Create a cluster
3. Get connection string
4. Add to `.env`:
```
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/social-media
```

## API Testing

### Using Postman

1. Import API collection or create requests
2. Set Authorization header with Bearer token:
```
Authorization: Bearer <token>
```

### Using cURL

```bash
# Register
curl -X POST http://localhost:5000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "username": "testuser",
    "email": "test@example.com",
    "password": "password123",
    "firstName": "Test",
    "lastName": "User"
  }'

# Login
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "password123"
  }'

# Create Post (requires token)
curl -X POST http://localhost:5000/api/posts \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <token>" \
  -d '{
    "content": "Hello World!"
  }'
```

## Debugging

### Backend
- Check logs in terminal running `npm run dev`
- Use `console.log()` or debugger
- Check MongoDB data with MongoDB Compass

### Frontend
- Use React DevTools browser extension
- Open browser console (F12)
- Use Redux DevTools if using Redux
- Check Network tab for API calls

## Code Standards

### Naming Conventions
- Files: PascalCase for components, camelCase for utilities
- Variables: camelCase
- Constants: UPPER_SNAKE_CASE
- Classes: PascalCase

### TypeScript
- Always define types/interfaces
- Avoid `any` type
- Use strict mode
- Define return types for functions

### Git Workflow
```bash
# Create feature branch
git checkout -b feature/my-feature

# Make changes and commit
git add .
git commit -m "feat: add new feature"

# Push and create PR
git push origin feature/my-feature
```

## Common Issues

### Port Already in Use
```bash
# Find process using port 5000
lsof -i :5000
# Kill process
kill -9 <PID>
```

### MongoDB Connection Error
- Check MongoDB is running
- Verify connection string in .env
- Check firewall/network settings

### CORS Errors
- Add frontend URL to CORS in backend
- Check Authorization header format

### Token Expired
- Implement token refresh mechanism
- Auto-redirect to login on 401

## Performance Optimization

- Implement pagination for large datasets
- Use database indexing
- Lazy load images
- Minimize bundle size
- Use React.memo for expensive components

## Testing

### Backend Testing
```bash
npm test
```

### Frontend Testing
```bash
npm test
```

## Deployment Checklist

- [ ] Environment variables set correctly
- [ ] Database backups created
- [ ] Security headers configured
- [ ] HTTPS enabled
- [ ] API endpoints tested
- [ ] Frontend builds successfully
- [ ] Performance optimized
- [ ] Error logging configured
- [ ] Rate limiting enabled
- [ ] CORS properly configured

---

For more questions, check the main README.md or contact the development team.
