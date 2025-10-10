@echo off
echo ========================================
echo coinflip - Quick Build Script
echo ========================================
echo.

echo Checking prerequisites...
echo.

echo [1/4] Checking Node.js...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Node.js is not installed!
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)
node --version
echo.

echo [2/4] Checking Rust...
rustc --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Rust is not installed!
    echo Please install Rust from https://rustup.rs/
    pause
    exit /b 1
)
rustc --version
echo.

echo [3/4] Installing dependencies...
call npm install
if %errorlevel% neq 0 (
    echo ERROR: Failed to install dependencies!
    pause
    exit /b 1
)
echo.

echo [4/4] Building application...
echo This may take 5-10 minutes on first build...
call npm run build
if %errorlevel% neq 0 (
    echo ERROR: Build failed!
    pause
    exit /b 1
)
echo.

echo ========================================
echo Build completed successfully!
echo ========================================
echo.
echo Installers created in:
echo   src-tauri\target\release\bundle\nsis\
echo   src-tauri\target\release\bundle\msi\
echo.
echo NSIS Installer: coinflip_1.0.0_x64-setup.exe
echo MSI Installer:  coinflip_1.0.0_x64_en-US.msi
echo.
pause
