@echo off
echo ========================================
echo coinflip - Quick Development Mode
echo ========================================
echo.

echo Checking prerequisites...
echo.

echo [1/3] Checking Node.js...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Node.js is not installed!
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)
node --version
echo.

echo [2/3] Checking Rust...
rustc --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Rust is not installed!
    echo Please install Rust from https://rustup.rs/
    pause
    exit /b 1
)
rustc --version
echo.

echo [3/3] Installing dependencies (if needed)...
if not exist "node_modules" (
    call npm install
    if %errorlevel% neq 0 (
        echo ERROR: Failed to install dependencies!
        pause
        exit /b 1
    )
)
echo.

echo ========================================
echo Starting development mode...
echo ========================================
echo.
echo First run may take 5-10 minutes to compile.
echo The application window will open automatically.
echo Press Ctrl+C to stop the development server.
echo.

call npm run dev
