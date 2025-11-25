#!/usr/bin/env python3
"""
Movie Downloader App Launcher
This script starts the Node.js development server and opens the app in your browser.
"""

import os
import sys
import subprocess
import time
import webbrowser
from pathlib import Path

def main():
    # Get the directory where this script is located
    script_dir = Path(__file__).parent.absolute()
    
    print("=" * 60)
    print("🎬 Movie Downloader Web Application")
    print("=" * 60)
    print()
    
    # Check if node_modules exists
    node_modules = script_dir / "node_modules"
    if not node_modules.exists():
        print("❌ Error: node_modules not found!")
        print("Please run 'npm install --legacy-peer-deps' first.")
        print()
        input("Press Enter to exit...")
        sys.exit(1)
    
    # Check if .env.local exists
    env_file = script_dir / ".env.local"
    if not env_file.exists():
        print("⚠️  Warning: .env.local file not found!")
        print("Creating .env.local with default values...")
        print()
        
        env_content = """TMDB_API_KEY=d9538d5491256c355146ce48821397ce
DATABASE_URL=mysql://user:password@localhost:3306/movie_downloader
JWT_SECRET=your-secret-key-here
VITE_APP_ID=your-app-id
OAUTH_SERVER_URL=https://api.manus.im
VITE_OAUTH_PORTAL_URL=https://oauth.manus.im
OWNER_OPEN_ID=your-owner-id
OWNER_NAME=Your Name
VITE_APP_TITLE=Movie Downloader Web Application
"""
        
        with open(env_file, 'w') as f:
            f.write(env_content)
        
        print("✅ .env.local created successfully!")
        print()
    
    print("🚀 Starting the development server...")
    print("This may take a moment on first run...")
    print()
    
    # Change to script directory
    os.chdir(script_dir)
    
    # Start the npm dev server
    try:
        # Use cross-env for Windows compatibility
        process = subprocess.Popen(
            [sys.executable, "-m", "pip", "install", "cross-env"] if sys.platform == "win32" else [],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE
        )
        
        # Start the actual dev server
        cmd = [
            "npx", "cross-env",
            "NODE_ENV=development",
            "tsx", "watch",
            "server/_core/index.ts"
        ]
        
        print(f"Running: {' '.join(cmd)}")
        print()
        
        process = subprocess.Popen(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            bufsize=1
        )
        
        # Wait for server to start
        print("⏳ Waiting for server to start...")
        time.sleep(5)
        
        # Open browser
        print("🌐 Opening browser...")
        webbrowser.open("http://localhost:3000")
        
        print()
        print("=" * 60)
        print("✅ Server is running!")
        print("🌐 Browser should open automatically at http://localhost:3000")
        print()
        print("💡 Tips:")
        print("   - Search for any movie by name")
        print("   - Select quality (SD, HD, 4K)")
        print("   - Click Download to get the movie")
        print()
        print("❌ To stop the server, close this window")
        print("=" * 60)
        print()
        
        # Keep the process running and display output
        for line in process.stdout:
            print(line, end='')
        
        process.wait()
        
    except FileNotFoundError:
        print("❌ Error: npm or Node.js not found!")
        print("Please make sure Node.js is installed and added to PATH.")
        print()
        input("Press Enter to exit...")
        sys.exit(1)
    except KeyboardInterrupt:
        print()
        print("🛑 Server stopped by user")
        process.terminate()
        sys.exit(0)
    except Exception as e:
        print(f"❌ Error: {e}")
        input("Press Enter to exit...")
        sys.exit(1)

if __name__ == "__main__":
    main()
