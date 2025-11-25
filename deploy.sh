#!/bin/bash

# Movie Downloader App - Deployment Script
# This script prepares the app for production deployment

set -e

echo "🚀 Movie Downloader App - Deployment Preparation"
echo "=================================================="

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js is not installed${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Node.js found: $(node --version)${NC}"

# Install dependencies
echo -e "${YELLOW}📦 Installing dependencies...${NC}"
npm install --production

# Build the application
echo -e "${YELLOW}🔨 Building application...${NC}"
npm run build

# Create deployment directory
DEPLOY_DIR="./deployment"
if [ -d "$DEPLOY_DIR" ]; then
    rm -rf "$DEPLOY_DIR"
fi
mkdir -p "$DEPLOY_DIR"

echo -e "${YELLOW}📁 Preparing deployment package...${NC}"

# Copy necessary files
cp -r dist "$DEPLOY_DIR/"
cp -r node_modules "$DEPLOY_DIR/" 2>/dev/null || echo "Note: node_modules will be installed on server"
cp package.json "$DEPLOY_DIR/"
cp package-lock.json "$DEPLOY_DIR/" 2>/dev/null || true
cp .env.production "$DEPLOY_DIR/.env" 2>/dev/null || echo "⚠️  .env.production not found - create it before deploying"
cp drizzle.config.ts "$DEPLOY_DIR/" 2>/dev/null || true
cp tsconfig.json "$DEPLOY_DIR/" 2>/dev/null || true

# Create deployment README
cat > "$DEPLOY_DIR/DEPLOY_README.md" << 'EOF'
# Movie Downloader App - Deployment Guide

## Quick Start

### 1. Environment Setup
```bash
cd deployment
npm install --production
```

### 2. Set Environment Variables
Create a `.env` file with:
```
NODE_ENV=production
DATABASE_URL=your_database_url
JWT_SECRET=your_secret_key
TMDB_API_KEY=your_tmdb_key
VITE_APP_TITLE=Movie Downloader Web Application
VITE_OAUTH_PORTAL_URL=https://oauth.manus.im
OAUTH_SERVER_URL=https://api.manus.im
```

### 3. Run the Application
```bash
npm start
```

The app will be available at http://localhost:3000

### 4. Deploy to Vercel (Recommended)
```bash
npm install -g vercel
vercel
```

### 5. Deploy to Railway
- Go to https://railway.app
- Create new project
- Connect GitHub repository
- Set environment variables
- Deploy

## Troubleshooting

**Port already in use:**
```bash
PORT=3001 npm start
```

**Database connection error:**
- Check DATABASE_URL is correct
- Ensure database is accessible
- Run migrations: `npm run db:push`

**Build errors:**
- Clear cache: `rm -rf dist node_modules`
- Reinstall: `npm install`
- Rebuild: `npm run build`

## Features Deployed

✅ Public domain movie search (Internet Archive)
✅ Open-source games search (GitHub)
✅ Free software search
✅ User authentication and favorites
✅ Search analytics and trending
✅ Audit logging
✅ Rate limiting
✅ Security headers
✅ CORS protection

## Support

For issues or questions, check the main README.md
EOF

echo -e "${GREEN}✓ Deployment package created in: $DEPLOY_DIR${NC}"
echo ""
echo -e "${YELLOW}📊 Deployment Package Contents:${NC}"
du -sh "$DEPLOY_DIR"/*
echo ""
echo -e "${GREEN}✓ Ready to deploy!${NC}"
echo ""
echo "Next steps:"
echo "1. Option A: Deploy to Vercel (recommended)"
echo "   cd $DEPLOY_DIR && vercel"
echo ""
echo "2. Option B: Deploy to Railway"
echo "   Push to GitHub and connect to Railway"
echo ""
echo "3. Option C: Deploy to your own server"
echo "   Copy $DEPLOY_DIR to your server and run: npm start"
