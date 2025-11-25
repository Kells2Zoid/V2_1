# Movie Downloader - Batch File Guide

## What is the Batch File?

The `START_APP.bat` file is a simple Windows batch script that automatically:
1. ✅ Starts your Node.js development server
2. ✅ Opens your browser to the app
3. ✅ Displays helpful information

**No more typing commands!** Just double-click and you're done.

---

## How to Use

### Step 1: Download the Batch File

Download `START_APP.bat` from the Management UI and place it in your project folder:

```
D:\Users\ADMIN\Desktop\movie site\movie_downloader_app_v2\START_APP.bat
```

### Step 2: Double-Click to Run

Simply double-click `START_APP.bat` and:
- A Command Prompt window opens
- The server starts automatically
- Your browser opens to `http://localhost:3001`
- Your Movie Downloader app loads!

### Step 3: Use Your App

1. **Type a movie name** in the search box
2. **Click Search**
3. **See movie posters appear**
4. **Select quality** (SD, HD, 4K)
5. **Click Download**

---

## What Happens Inside

When you double-click the batch file:

1. **Checks if dependencies are installed** - If not, runs `npm install`
2. **Starts the server** - Runs the Node.js development server
3. **Waits 5 seconds** - Gives the server time to start
4. **Opens your browser** - Automatically navigates to `http://localhost:3001`
5. **Keeps running** - The Command Prompt stays open while the app runs

---

## Stopping the App

**Option 1: Close the Command Prompt window**
- Click the X button on the Command Prompt
- The server stops

**Option 2: Press Ctrl+C**
- In the Command Prompt, press `Ctrl+C`
- Type `Y` to confirm
- The server stops

---

## Troubleshooting

### "package.json not found" error
- Make sure the batch file is in your project folder
- The batch file should be at: `D:\Users\ADMIN\Desktop\movie site\movie_downloader_app_v2\START_APP.bat`

### Browser doesn't open automatically
- The server is still running (you can see it in the Command Prompt)
- Manually open your browser and go to: `http://localhost:3001`

### "npm: command not found" error
- Node.js is not installed or not in your PATH
- Restart your computer after installing Node.js
- Or reinstall Node.js and make sure to check "Add to PATH"

### Port 3001 already in use
- Another app is using that port
- Close the other app and try again
- Or wait a moment and refresh your browser

### Movies don't show up
- Check that `.env.local` has your TMDB API key
- Restart the batch file

---

## Creating a Desktop Shortcut (Optional)

To make it even easier, create a desktop shortcut:

1. **Right-click on `START_APP.bat`**
2. **Select "Send to" > "Desktop (create shortcut)"**
3. **Now you can double-click the shortcut from your desktop!**

You can even customize the shortcut icon:
1. **Right-click the shortcut**
2. **Select "Properties"**
3. **Click "Change Icon"**
4. **Choose a movie-themed icon**

---

## Advanced: Customizing the Batch File

### Change the port
Edit `START_APP.bat` and find this line:
```batch
start http://localhost:3001
```

Change `3001` to your desired port (e.g., `8080`):
```batch
start http://localhost:8080
```

### Change the browser
By default, it opens your default browser. To open a specific browser:

**For Chrome:**
```batch
start chrome http://localhost:3001
```

**For Firefox:**
```batch
start firefox http://localhost:3001
```

**For Edge:**
```batch
start msedge http://localhost:3001
```

---

## Summary

**That's it!** The batch file makes running your app as simple as:

1. **Double-click `START_APP.bat`**
2. **Wait for browser to open**
3. **Start searching for movies!**

No more remembering commands or opening multiple windows. Enjoy! 🎬
