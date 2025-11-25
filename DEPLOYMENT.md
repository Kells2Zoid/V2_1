# Movie Downloader App - Deployment Guide

## Quick Start: Deploy to Vercel (Free)

### Option 1: Deploy via Vercel CLI (Fastest)

1. **Install Vercel CLI:**
   ```bash
   npm install -g vercel
   ```

2. **Login to Vercel:**
   ```bash
   vercel login
   ```

3. **Deploy from project directory:**
   ```bash
   cd /path/to/movie_downloader_app
   vercel
   ```

4. **Follow the prompts** - Vercel will ask about project settings. Accept defaults.

5. **Set environment variables in Vercel Dashboard:**
   - Go to https://vercel.com/dashboard
   - Select your project
   - Go to Settings → Environment Variables
   - Add these variables:
     - `JWT_SECRET`: Generate a random string (e.g., `openssl rand -hex 32`)
     - `TMDB_API_KEY`: Your TMDB API key (already in .env.local)
     - `NODE_ENV`: `production`

### Option 2: Deploy via GitHub (Recommended for Updates)

1. **Push to GitHub:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/YOUR_USERNAME/movie-downloader-app.git
   git push -u origin main
   ```

2. **Connect to Vercel:**
   - Go to https://vercel.com/new
   - Import your GitHub repository
   - Vercel auto-detects it's a Node.js app
   - Add environment variables (same as above)
   - Click Deploy

3. **Every push to main** will automatically redeploy

### Option 3: Deploy to Railway (Alternative)

1. **Go to https://railway.app**
2. **Click "New Project" → "Deploy from GitHub"**
3. **Connect your GitHub account and select the repo**
4. **Railway auto-configures most settings**
5. **Add environment variables in the Railway dashboard**
6. **Deploy**

## Environment Variables Needed

```
JWT_SECRET=your-random-secret-key
TMDB_API_KEY=d9538d5491256c355146ce48821397ce
NODE_ENV=production
VITE_APP_TITLE=Movie Downloader Web Application
VITE_APP_LOGO=/logo.svg
VITE_OAUTH_PORTAL_URL=https://oauth.manus.im
OAUTH_SERVER_URL=https://api.manus.im
```

## Features Available Without Database

The app works fully without a database for:
- ✅ Searching public domain movies (Internet Archive)
- ✅ Searching open-source games (GitHub)
- ✅ Searching free software (curated catalog)
- ✅ Displaying torrent metadata (seeders, leechers, file size)
- ✅ Copying magnet links

The download tracking feature requires a database connection, but the core search functionality works perfectly.

## Testing Your Deployment

Once deployed:
1. Visit your Vercel/Railway URL
2. Try searching for a movie (e.g., "charlie chaplin")
3. Try searching for a game (e.g., "mindustry")
4. Try searching for software (e.g., "vlc")
5. Copy a magnet link to test

## Troubleshooting

**Build fails?**
- Check that Node.js version is 18+
- Ensure all dependencies are installed: `npm install`

**App won't start?**
- Check environment variables are set correctly
- Look at deployment logs in Vercel/Railway dashboard

**Search not working?**
- Check internet connection
- Verify API endpoints are accessible
- Check browser console for errors

## Next Steps

Once deployed:
1. Share the URL with users
2. Monitor usage and performance
3. Iterate on features based on feedback
4. Consider adding authentication for advanced features
