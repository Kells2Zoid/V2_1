@echo off
REM Movie Downloader App - Windows Backup Script
REM This script copies the entire app to your Windows Desktop

setlocal enabledelayedexpansion

echo.
echo ============================================
echo Movie Downloader App - Backup to Windows
echo ============================================
echo.

REM Define paths
set SOURCE_DIR=%~dp0
set DEST_DIR=D:\Users\ADMIN\Desktop\movie site\App versions\movie_downloader_app_v10

REM Check if destination directory exists, if not create it
if not exist "%DEST_DIR%" (
    echo Creating destination directory...
    mkdir "%DEST_DIR%"
    if errorlevel 1 (
        echo ERROR: Failed to create destination directory
        echo Make sure the path exists: %DEST_DIR%
        pause
        exit /b 1
    )
)

echo Source: %SOURCE_DIR%
echo Destination: %DEST_DIR%
echo.

REM Copy the entire project
echo Copying files... This may take a moment...
xcopy "%SOURCE_DIR%*" "%DEST_DIR%\" /E /I /Y /Q

if errorlevel 1 (
    echo ERROR: Failed to copy files
    pause
    exit /b 1
)

echo.
echo ============================================
echo SUCCESS! App backed up to Windows
echo ============================================
echo.
echo Backup location:
echo %DEST_DIR%
echo.
echo Next steps:
echo 1. Install Node.js on Windows (if not already installed)
echo 2. Open Command Prompt in the backup folder
echo 3. Run: npm install
echo 4. Run: npm run dev
echo.
pause
