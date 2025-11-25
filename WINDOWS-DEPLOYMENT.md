# Movie Downloader App - Windows Deployment Guide

## Quick Start for Windows

### Step 1: Prerequisites
- Windows 10 or later
- Node.js 18+ installed ([Download here](https://nodejs.org/))
- Git (optional, for version control)

### Step 2: Copy to Your Desktop
The app is ready to copy to:
```
D:\Users\ADMIN\Desktop\movie site\App versions\movie_downloader_app_v10
```

**Option A: Using File Explorer**
1. Copy the entire `movie_downloader_app` folder
2. Paste it to your destination path
3. Rename it to `movie_downloader_app_v10` if needed

**Option B: Using Command Prompt**
```cmd
xcopy "C:\path\to\movie_downloader_app" "D:\Users\ADMIN\Desktop\movie site\App versions\movie_downloader_app_v10" /E /I /Y
```

### Step 3: Install Dependencies
1. Open Command Prompt (Win + R, type `cmd`)
2. Navigate to your app folder:
   ```cmd
   cd "D:\Users\ADMIN\Desktop\movie site\App versions\movie_downloader_app_v10"
   ```
3. Install dependencies:
   ```cmd
   npm install
   ```

### Step 4: Configure Environment
1. Create a `.env.local` file in the app root with:
   ```
   NODE_ENV=development
   DATABASE_URL=mysql://user:password@localhost:3306/movie_downloader
   JWT_SECRET=your-secret-key-here
   TMDB_API_KEY=d9538d5491256c355146ce48821397ce
   VITE_APP_TITLE=Movie Downloader Web Application
   VITE_OAUTH_PORTAL_URL=https://oauth.manus.im
   OAUTH_SERVER_URL=https://api.manus.im
   ```

### Step 5: Run the App

**Development Mode:**
```cmd
npm run dev
```
App will be available at: http://localhost:5173

**Production Mode:**
```cmd
npm run build
npm start
```
App will be available at: http://localhost:3000

## Deployment Options

### Option 1: Vercel (Recommended for Web)
1. Install Vercel CLI:
   ```cmd
   npm install -g vercel
   ```
2. Deploy:
   ```cmd
   vercel
   ```
3. Follow the prompts

### Option 2: Railway
1. Go to https://railway.app
2. Create new project
3. Connect your GitHub repository
4. Set environment variables
5. Deploy

### Option 3: Local Server
1. Install Node.js on your server
2. Copy the app folder
3. Run `npm install`
4. Run `npm start`
5. Use a reverse proxy (Nginx/Apache) to expose port 3000

## Troubleshooting

### "npm: command not found"
- Node.js not installed or not in PATH
- Restart Command Prompt after installing Node.js
- Check installation: `node --version`

### "Port 3000 already in use"
```cmd
netstat -ano | findstr :3000
taskkill /PID <PID> /F
```
Or use a different port:
```cmd
set PORT=3001 && npm start
```

### "Database connection error"
- Check DATABASE_URL is correct
- Ensure database server is running
- Verify credentials

### Build errors
```cmd
REM Clear cache and reinstall
rmdir /s /q node_modules
del package-lock.json
npm install
npm run build
```

## Features

✅ Public domain movie search (Internet Archive)
✅ Open-source games search (GitHub)
✅ Free software search
✅ User authentication and favorites
✅ Search analytics and trending
✅ Audit logging
✅ Rate limiting
✅ Security headers
✅ CORS protection

## Project Structure

```
movie_downloader_app/
├── client/              # React frontend
│   ├── src/
│   │   ├── pages/      # Page components
│   │   ├── components/ # Reusable components
│   │   └── lib/        # Utilities and hooks
│   └── public/         # Static assets
├── server/             # Express backend
│   ├── routers/        # tRPC routers
│   ├── services/       # External API services
│   └── _core/          # Core functionality
├── drizzle/            # Database schema
├── package.json        # Dependencies
└── vite.config.ts      # Vite configuration
```

## Development Workflow

1. **Start dev server:**
   ```cmd
   npm run dev
   ```

2. **Make changes** to files in `client/src/` or `server/`

3. **Changes auto-reload** thanks to Vite

4. **Build for production:**
   ```cmd
   npm run build
   ```

5. **Test production build:**
   ```cmd
   npm start
   ```

## Database Setup

If you want to use the database features:

1. Install MySQL locally or use a cloud service
2. Update DATABASE_URL in .env.local
3. Run migrations:
   ```cmd
   npm run db:push
   ```

## Support & Resources

- **Node.js Docs:** https://nodejs.org/docs/
- **React Docs:** https://react.dev/
- **Vite Docs:** https://vitejs.dev/
- **tRPC Docs:** https://trpc.io/
- **Tailwind CSS:** https://tailwindcss.com/

## Next Steps

1. Customize the app with your branding
2. Add your own content sources
3. Deploy to production
4. Monitor analytics
5. Iterate based on user feedback

Good luck with your app! 🚀
