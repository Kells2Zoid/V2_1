@echo off
REM Movie Downloader App - Development Server Launcher
REM This script starts the development server on Windows

title Movie Downloader App - Development Server

echo.
echo ============================================
echo Movie Downloader App - Dev Server
echo ============================================
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Node.js is not installed or not in PATH
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

echo Node.js version:
node --version

echo.
echo Starting development server...
echo.
echo The app will be available at: http://localhost:5173
echo.
echo Press Ctrl+C to stop the server
echo.

npm run dev

pause
