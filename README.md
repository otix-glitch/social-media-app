# SocialHub - Social Media App

A modern, full-stack social media application built with React, Node.js, Express, and MongoDB.

## Features

✨ **Core Features:**
- User Authentication (Register & Login)
- User Profiles with Bio and Profile Images
- Create, Read, Update, Delete Posts
- Like/Unlike Posts and Comments
- Comment on Posts
- Follow/Unfollow Users
- Responsive Design
- Real-time Updates

## Tech Stack

### Backend
- **Framework**: Express.js (Node.js)
- **Language**: TypeScript
- **Database**: MongoDB with Mongoose ODM
- **Authentication**: JWT (JSON Web Tokens)
- **Security**: bcryptjs for password hashing

### Frontend
- **Framework**: React 18
- **Language**: TypeScript
- **Routing**: React Router v6
- **Styling**: CSS3
- **State Management**: React Hooks

## Project Structure

```
social media/
├── backend/
│   ├── src/
│   │   ├── models/           # MongoDB schemas
│   │   │   ├── User.ts
│   │   │   ├── Post.ts
│   │   │   ├── Comment.ts
│   │   │   └── Like.ts
│   │   ├── controllers/      # Business logic
│   │   │   ├── authController.ts
│   │   │   ├── postController.ts
│   │   │   └── interactionController.ts
│   │   ├── routes/          # API endpoints
│   │   │   ├── authRoutes.ts
│   │   │   ├── postRoutes.ts
│   │   │   └── interactionRoutes.ts
│   │   ├── middleware/      # Express middleware
│   │   │   └── auth.ts
│   │   └── server.ts        # Main server file
│   ├── package.json
│   ├── tsconfig.json
│   └── .env.example
│
└── frontend/
    ├── src/
    │   ├── components/      # Reusable components
    │   │   ├── PostCard.tsx
    │   │   ├── CommentSection.tsx
    │   │   ├── UserProfile.tsx
    │   │   ├── CreatePost.tsx
    │   │   └── Navigation.tsx
    │   ├── pages/          # Page components
    │   │   ├── Home.tsx
    │   │   ├── Login.tsx
    │   │   ├── Signup.tsx
    │   │   └── Profile.tsx
    │   ├── hooks/          # Custom React hooks
    │   │   └── useApi.ts
    │   ├── App.tsx
    │   ├── App.css
    │   ├── index.tsx
    │   └── index.css
    ├── public/
    │   └── index.html
    ├── package.json
    ├── tsconfig.json
    └── .env.example
```

## Installation & Setup

### Prerequisites
- Node.js (v14 or higher)
- npm or yarn
- MongoDB (local or Atlas)

### Backend Setup

1. Navigate to backend directory:
```bash
cd backend
```

2. Install dependencies:
```bash
npm install
```

3. Create `.env` file (copy from `.env.example`):
```bash
cp .env.example .env
```

4. Update `.env` with your MongoDB URI and JWT secret:
```
MONGODB_URI=mongodb://localhost:27017/social-media
JWT_SECRET=your_super_secret_jwt_key
PORT=5000
```

5. Start the backend server:
```bash
npm run dev
```

The backend will be running on `http://localhost:5000`

### Frontend Setup

1. Navigate to frontend directory:
```bash
cd frontend
```

2. Install dependencies:
```bash
npm install
```

3. Create `.env` file (copy from `.env.example`):
```bash
cp .env.example .env
```

4. The `.env` file should contain:
```
REACT_APP_API_URL=http://localhost:5000/api
```

5. Start the development server:
```bash
npm start
```

The frontend will be running on `http://localhost:3000`

## API Documentation

### Authentication Endpoints

#### Register User
```
POST /api/auth/register
Body: { username, email, password, firstName, lastName }
Response: { token, user }
```

#### Login User
```
POST /api/auth/login
Body: { email, password }
Response: { token, user }
```

#### Get Current User
```
GET /api/auth/me
Headers: { Authorization: Bearer <token> }
Response: { user }
```

### User Endpoints

#### Get User by ID
```
GET /api/auth/:id
Response: { user with followers and following }
```

#### Update Profile
```
PUT /api/auth/profile/update
Headers: { Authorization: Bearer <token> }
Body: { firstName, lastName, bio, profileImage }
Response: { updated user }
```

#### Follow User
```
POST /api/auth/:userId/follow
Headers: { Authorization: Bearer <token> }
Response: { message }
```

#### Unfollow User
```
POST /api/auth/:userId/unfollow
Headers: { Authorization: Bearer <token> }
Response: { message }
```

### Post Endpoints

#### Create Post
```
POST /api/posts
Headers: { Authorization: Bearer <token> }
Body: { content, images[] }
Response: { post }
```

#### Get All Posts
```
GET /api/posts?page=1&limit=10
Response: { posts[], total, pages, currentPage }
```

#### Get Post by ID
```
GET /api/posts/:id
Response: { post with author, likes, comments }
```

#### Update Post
```
PUT /api/posts/:id
Headers: { Authorization: Bearer <token> }
Body: { content, images[] }
Response: { updated post }
```

#### Delete Post
```
DELETE /api/posts/:id
Headers: { Authorization: Bearer <token> }
Response: { message }
```

#### Get User Posts
```
GET /api/posts/user/:userId
Response: { posts[] }
```

### Interaction Endpoints

#### Create Comment
```
POST /api/interactions/comments/:postId
Headers: { Authorization: Bearer <token> }
Body: { content }
Response: { comment }
```

#### Get Comments
```
GET /api/interactions/comments/:postId
Response: { comments[] }
```

#### Update Comment
```
PUT /api/interactions/comments/:commentId
Headers: { Authorization: Bearer <token> }
Body: { content }
Response: { updated comment }
```

#### Delete Comment
```
DELETE /api/interactions/comments/:commentId
Headers: { Authorization: Bearer <token> }
Response: { message }
```

#### Like Post
```
POST /api/interactions/likes/post/:postId
Headers: { Authorization: Bearer <token> }
Response: { post, liked }
```

#### Like Comment
```
POST /api/interactions/likes/comment/:commentId
Headers: { Authorization: Bearer <token> }
Response: { comment, liked }
```

## Features Explained

### User Authentication
- Secure password hashing with bcryptjs
- JWT token-based authentication
- Automatic token storage in localStorage
- Protected routes that require authentication

### Posts
- Create posts with text and multiple images
- Edit and delete your own posts
- Like and unlike posts
- View post author information

### Comments
- Add comments to posts
- Edit and delete your own comments
- Like comments (prepared in backend)
- Real-time comment counts

### User Profiles
- Custom user profiles with bio
- Profile images
- Follow/unfollow system
- View follower and following lists
- View user's posts

## Future Enhancements

- 📸 Image upload to cloud storage (AWS S3 / Cloudinary)
- 💬 Real-time messaging between users
- 🔔 Notification system
- 🌙 Dark mode
- 🔍 Search functionality
- #️⃣ Hashtags and trending topics
- 📱 Mobile app with React Native
- 🎥 Video support
- 📊 Analytics dashboard
- 🔐 Two-factor authentication

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, email support@socialhub.com or open an issue on GitHub.

## Authors

- Your Name - Initial work

---

**Happy Coding! 🚀**
