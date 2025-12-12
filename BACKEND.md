# Backend API Reference

## Database Models

### User Model
```typescript
{
  _id: ObjectId
  username: String (unique, required)
  email: String (unique, required)
  password: String (hashed, required)
  firstName: String
  lastName: String
  bio: String
  profileImage: String
  followers: ObjectId[] (User references)
  following: ObjectId[] (User references)
  createdAt: Date
  updatedAt: Date
}
```

### Post Model
```typescript
{
  _id: ObjectId
  content: String (required, max 1000)
  author: ObjectId (User reference, required)
  images: String[]
  likes: ObjectId[] (User references)
  likeCount: Number (default 0)
  commentCount: Number (default 0)
  createdAt: Date
  updatedAt: Date
}
```

### Comment Model
```typescript
{
  _id: ObjectId
  content: String (required, max 500)
  author: ObjectId (User reference, required)
  post: ObjectId (Post reference, required)
  likes: ObjectId[] (User references)
  createdAt: Date
  updatedAt: Date
}
```

### Like Model
```typescript
{
  _id: ObjectId
  user: ObjectId (User reference, required)
  post: ObjectId (Post reference, optional)
  comment: ObjectId (Comment reference, optional)
  createdAt: Date
}
```

## Authentication Flow

1. User registers with username, email, password, firstName, lastName
2. Password is hashed using bcryptjs before storage
3. JWT token is generated and returned
4. Token is stored in browser's localStorage
5. Token is sent in Authorization header for protected routes
6. Backend verifies token before allowing access

## Error Handling

All endpoints return appropriate HTTP status codes:
- `200 OK` - Successful GET request
- `201 Created` - Successful POST request
- `400 Bad Request` - Invalid input
- `401 Unauthorized` - Missing or invalid authentication
- `403 Forbidden` - Not authorized to perform action
- `404 Not Found` - Resource not found
- `500 Internal Server Error` - Server error

## Security Features

- Password hashing with bcryptjs
- JWT token-based authentication
- Protected routes with middleware
- Input validation
- CORS enabled
- Environment variables for sensitive data

## Deployment

### Backend Deployment (Heroku, Render, etc.)

1. Set environment variables on hosting platform
2. Build TypeScript: `npm run build`
3. Start server: `npm start`

### Frontend Deployment (Vercel, Netlify, etc.)

1. Set REACT_APP_API_URL to production API URL
2. Build: `npm run build`
3. Deploy build folder
