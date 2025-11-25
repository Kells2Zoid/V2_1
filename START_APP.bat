@echo off
REM Movie Downloader - Simple Batch File Launcher
REM Just double-click this file to start your app!

echo.
echo ================================================
echo   🎬 Movie Downloader Web Application
echo ================================================
echo.

REM Check if we're in the right directory
if not exist "package.json" (
    echo ❌ Error: package.json not found!
    echo Please make sure this file is in your project folder.
    echo.
    pause
    exit /b 1
)

REM Check if node_modules exists
if not exist "node_modules" (
    echo ⚠️  Installing dependencies...
    call npm install --legacy-peer-deps
    if errorlevel 1 (
        echo ❌ Failed to install dependencies
        pause
        exit /b 1
    )
)

echo ✅ Starting the server...
echo.
echo 🚀 The app will open in your browser automatically
echo.
echo ================================================
echo.

REM Start the server
start "" npx cross-env NODE_ENV=development tsx watch server/_core/index.ts

REM Wait a moment for the server to start
timeout /t 5 /nobreak

REM Open the browser
echo 🌐 Opening browser...
start http://localhost:3001

REM Keep the window open
echo.
echo ================================================
echo ✅ Server is running!
echo 🌐 Browser should open at http://localhost:3001
echo.
echo 💡 Tips:
echo    - Search for any movie by name
echo    - Select quality (SD, HD, 4K)
echo    - Click Download
echo.
echo ❌ To stop: Close this window or press Ctrl+C
echo ================================================
echo.

REM Keep waiting for user input
pause
