@echo off
REM Movie Downloader App - Production Server Launcher
REM This script builds and starts the production server on Windows

title Movie Downloader App - Production Server

echo.
echo ============================================
echo Movie Downloader App - Production Server
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
echo Building application...
echo.

call npm run build

if errorlevel 1 (
    echo ERROR: Build failed
    pause
    exit /b 1
)

echo.
echo Build successful!
echo.
echo Starting production server...
echo.
echo The app will be available at: http://localhost:3000
echo.
echo Press Ctrl+C to stop the server
echo.

call npm start

pause
