#!/usr/bin/env python3
"""
Build script to create an .exe file from the launcher.py script using PyInstaller
Run this script on Windows to generate the .exe file
"""

import os
import sys
import subprocess
from pathlib import Path

def main():
    print("=" * 60)
    print("🎬 Movie Downloader - EXE Builder")
    print("=" * 60)
    print()
    
    # Check if PyInstaller is installed
    try:
        import PyInstaller
    except ImportError:
        print("❌ PyInstaller not found!")
        print("Installing PyInstaller...")
        subprocess.check_call([sys.executable, "-m", "pip", "install", "pyinstaller"])
    
    script_dir = Path(__file__).parent.absolute()
    launcher_script = script_dir / "launcher.py"
    
    if not launcher_script.exists():
        print(f"❌ Error: launcher.py not found at {launcher_script}")
        sys.exit(1)
    
    print(f"📦 Building .exe from {launcher_script.name}...")
    print()
    
    # PyInstaller command
    cmd = [
        sys.executable, "-m", "PyInstaller",
        "--onefile",  # Create a single .exe file
        "--windowed",  # No console window
        "--name", "MovieDownloader",  # Name of the .exe
        "--icon", "NONE",  # You can add an icon here later
        "--add-data", f"{script_dir}{os.pathsep}.",  # Include project files
        str(launcher_script)
    ]
    
    print(f"Running: {' '.join(cmd)}")
    print()
    
    try:
        result = subprocess.run(cmd, cwd=str(script_dir), check=True)
        
        print()
        print("=" * 60)
        print("✅ Build successful!")
        print()
        print("📁 Your .exe file is located at:")
        print(f"   {script_dir / 'dist' / 'MovieDownloader.exe'}")
        print()
        print("💡 How to use:")
        print("   1. Copy the MovieDownloader.exe file")
        print("   2. Place it anywhere on your computer")
        print("   3. Double-click it to run the app")
        print()
        print("📝 Note: The .exe needs the project files to run.")
        print("   Keep it in the same folder as the project.")
        print("=" * 60)
        
    except subprocess.CalledProcessError as e:
        print(f"❌ Build failed with error code {e.returncode}")
        sys.exit(1)
    except Exception as e:
        print(f"❌ Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
