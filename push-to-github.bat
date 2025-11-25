@echo off
REM Push code to GitHub with one click

echo Pushing code to GitHub...
echo.

git config user.email "manus-deployment@example.com"
git config user.name "Manus Deployment"

echo Adding all files...
git add -A

echo Committing changes...
git commit -m "Deploy: Fix jwt_secret environment variable and update code"

echo Pushing to GitHub...
git push origin main

echo.
echo Done! Vercel will automatically redeploy from GitHub.
echo Check your Vercel dashboard in a few moments.
pause
