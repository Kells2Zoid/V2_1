# Movie Downloader - EXE Build Guide

This guide will help you convert the Movie Downloader app into a standalone `.exe` file that you can run with a single click.

## Prerequisites

Before building the `.exe`, make sure you have:

1. **Python 3.8 or higher** installed on your Windows computer
2. **Node.js** installed (v18 or higher)
3. **npm** installed (comes with Node.js)
4. **The project folder** with all dependencies installed (`npm install --legacy-peer-deps`)

## Step 1: Install PyInstaller

Open Command Prompt and run:

```cmd
pip install pyinstaller
```

## Step 2: Build the EXE

Navigate to your project folder:

```cmd
cd "D:\Users\ADMIN\Desktop\movie site\movie_downloader_app"
```

Run the build script:

```cmd
python build_exe.py
```

This will:
- Install PyInstaller (if not already installed)
- Compile the launcher script
- Create a `dist` folder with `MovieDownloader.exe`

The build process takes 1-3 minutes.

## Step 3: Locate Your EXE

Once the build completes, your `.exe` file will be at:

```
D:\Users\ADMIN\Desktop\movie site\movie_downloader_app\dist\MovieDownloader.exe
```

## Step 4: Run the EXE

**Option A: Run from the project folder**
- Double-click `MovieDownloader.exe` in the `dist` folder
- The app will start automatically

**Option B: Create a shortcut**
- Right-click `MovieDownloader.exe`
- Select "Send to" > "Desktop (create shortcut)"
- Now you can run the app from your desktop!

## What Happens When You Run the EXE

1. The launcher checks for dependencies
2. Starts the Node.js development server
3. Opens your browser automatically to `http://localhost:3000`
4. The Movie Downloader app loads

## Troubleshooting

### "Node.js not found" error
- Make sure Node.js is installed
- Restart your computer after installing Node.js
- Check that Node.js is in your system PATH

### "npm: command not found"
- Reinstall Node.js
- Make sure to check "Add to PATH" during installation

### Port 3000 already in use
- Close any other applications using port 3000
- Or modify the port in `server/_core/index.ts`

### .exe closes immediately
- Check if there are any error messages in the console
- Make sure `.env.local` file exists in the project folder
- Verify all dependencies are installed (`npm install --legacy-peer-deps`)

## Advanced: Customizing the EXE

### Change the Icon

1. Create or find a `.ico` file (icon image)
2. Place it in the project folder
3. Modify `build_exe.py`:
   ```python
   "--icon", "your_icon.ico",  # Replace NONE with your icon file
   ```
4. Run `python build_exe.py` again

### Change the EXE Name

Edit `build_exe.py` and change:
```python
"--name", "MovieDownloader",  # Change this to your desired name
```

### Create a Console Window

Remove or comment out the `--windowed` flag in `build_exe.py` to see debug output.

## Distribution

When sharing the `.exe` with others:

1. **Keep the project structure intact** - The `.exe` needs the `node_modules`, `client`, `server`, and other folders
2. **Include the `.env.local` file** - Make sure it has the TMDB API key
3. **Provide installation instructions** - Users need Node.js installed first

Alternatively, you can:
- Create a ZIP file with the entire project folder
- Users extract it and run `MovieDownloader.exe`

## Future Versions

For more advanced packaging options, consider:

- **Electron** - Creates a true desktop app with native look and feel
- **pkg** - Bundles Node.js directly into the executable
- **NSIS** - Creates a professional installer

Let me know if you want to implement any of these later!

## Support

If you encounter issues:

1. Check the console output for error messages
2. Verify all prerequisites are installed
3. Make sure the project folder structure is intact
4. Try running `npm install --legacy-peer-deps` again

Happy downloading! 🎬
