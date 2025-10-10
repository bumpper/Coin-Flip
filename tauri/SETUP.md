# coinflip Setup Guide

This guide will help you set up the development environment and build the coinflip application.

## Prerequisites Check

Before starting, verify you have the required tools installed:

### 1. Check Rust Installation
```bash
rustc --version
cargo --version
```
Expected: Rust 1.70 or later

If not installed, download from: https://rustup.rs/

### 2. Check Node.js Installation
```bash
node --version
npm --version
```
Expected: Node.js 16 or later

If not installed or outdated, download from: https://nodejs.org/

### 3. Platform-Specific Dependencies

#### Windows
- **Visual Studio Build Tools**: Download from https://visualstudio.microsoft.com/downloads/
  - Select "Desktop development with C++"
- **WebView2**: Usually pre-installed on Windows 10/11
  - If needed, download from: https://developer.microsoft.com/en-us/microsoft-edge/webview2/

#### macOS
```bash
xcode-select --install
```

#### Linux (Debian/Ubuntu)
```bash
sudo apt update
sudo apt install libwebkit2gtk-4.1-dev \
  build-essential \
  curl \
  wget \
  file \
  libxdo-dev \
  libssl-dev \
  libayatana-appindicator3-dev \
  librsvg2-dev
```

#### Linux (Fedora/RHEL)
```bash
sudo dnf install webkit2gtk4.1-devel \
  openssl-devel \
  curl \
  wget \
  file \
  libappindicator-gtk3-devel \
  librsvg2-devel
```

## Project Setup

### Step 1: Install Node Dependencies
```bash
cd coinflip
npm install
```

This will install the Tauri CLI and other required packages.

### Step 2: Verify Installation
```bash
npx tauri --version
```

You should see the Tauri CLI version information.

### Step 3: Run Development Mode
```bash
npm run dev
```

This will:
1. Compile the Rust backend
2. Start the Tauri development window
3. Enable hot-reload for frontend changes

**First run may take 5-10 minutes** as Rust compiles all dependencies.

## Building Installers

### Build for Current Platform
```bash
npm run build
```

This creates installers for your current operating system in:
`src-tauri/target/release/bundle/`

### Platform-Specific Builds

**Windows (.exe, .msi):**
```bash
npm run build:windows
```

**macOS (.dmg, .app):**
```bash
npm run build:macos
```

**Linux (.deb, .rpm):**
```bash
npm run build:linux
```

## Expected Build Output

### Windows
- `src-tauri/target/release/bundle/nsis/coinflip_1.0.0_x64-setup.exe` (NSIS installer)
- `src-tauri/target/release/bundle/msi/coinflip_1.0.0_x64_en-US.msi` (MSI installer)

### macOS
- `src-tauri/target/release/bundle/dmg/coinflip_1.0.0_x64.dmg` (DMG image)
- `src-tauri/target/release/bundle/macos/coinflip.app` (App bundle)

### Linux
- `src-tauri/target/release/bundle/deb/coinflip_1.0.0_amd64.deb` (Debian package)
- `src-tauri/target/release/bundle/rpm/coinflip-1.0.0-1.x86_64.rpm` (RPM package)

## Installation Paths

The application installs to these default locations:

| Platform | Path | Notes |
|----------|------|-------|
| Windows (NSIS) | `%LOCALAPPDATA%\Programs\coinflip\` | Per-user install |
| Windows (MSI) | `C:\Program Files\coinflip\` | System-wide, requires admin |
| macOS | `/Applications/coinflip.app` | Standard app location |
| Linux | `/usr/bin/coinflip` | Binary location |

## Testing the Application

### Development Testing
```bash
npm run dev
```
- Test all features in the development window
- Check console for errors
- Verify coin flip animation
- Test dark mode toggle
- Verify statistics tracking
- Test localStorage persistence

### Production Testing

**Windows:**
1. Run the installer: `coinflip_1.0.0_x64-setup.exe`
2. Launch from Start Menu or Desktop shortcut
3. Test all features
4. Uninstall via Windows Settings

**macOS:**
1. Open the DMG file
2. Drag coinflip.app to Applications
3. Launch from Applications folder
4. Test all features
5. Uninstall by moving to Trash

**Linux (Debian/Ubuntu):**
```bash
sudo dpkg -i coinflip_1.0.0_amd64.deb
coinflip
sudo apt remove coinflip
```

**Linux (Fedora/RHEL):**
```bash
sudo rpm -i coinflip-1.0.0-1.x86_64.rpm
coinflip
sudo rpm -e coinflip
```

## Troubleshooting

### Issue: "npm run dev" fails with Rust compilation errors

**Solution:**
```bash
cd src-tauri
cargo clean
cargo update
cd ..
npm run dev
```

### Issue: Missing WebView2 on Windows

**Solution:**
Download and install WebView2 Runtime from:
https://developer.microsoft.com/en-us/microsoft-edge/webview2/

### Issue: Icon errors during build

**Solution:**
Verify all icon files exist in `src-tauri/icons/`:
```bash
ls src-tauri/icons/
```
Should show: 32x32.png, 128x128.png, 128x128@2x.png, icon.icns, icon.ico

### Issue: Build takes very long time

**Explanation:**
First build compiles all Rust dependencies (5-10 minutes is normal).
Subsequent builds are much faster (1-2 minutes).

### Issue: "command not found: tauri" or "npx tauri" fails

**Solution:**
```bash
npm install
```
Ensure @tauri-apps/cli is installed in node_modules.

## Development Tips

### Hot Reload
When running `npm run dev`, changes to HTML/CSS/JS are automatically reloaded.
Rust changes require restarting the dev server.

### Debugging
- Open DevTools in the Tauri window: Right-click → Inspect Element
- Check Rust logs in the terminal where you ran `npm run dev`

### Clean Build
If you encounter persistent issues:
```bash
# Clean Rust build
cd src-tauri
cargo clean
cd ..

# Clean Node modules
rm -rf node_modules package-lock.json
npm install

# Rebuild
npm run build
```

## Next Steps

1. ✅ Verify prerequisites are installed
2. ✅ Run `npm install`
3. ✅ Test with `npm run dev`
4. ✅ Build installers with `npm run build`
5. ✅ Test the installers on target platforms
6. ✅ Distribute to users

## Support Resources

- **Tauri Documentation**: https://tauri.app/
- **Tauri Discord**: https://discord.gg/tauri
- **Rust Documentation**: https://doc.rust-lang.org/
- **Project README**: See README.md for project overview
- **Build Instructions**: See BUILD_INSTRUCTIONS.md for detailed build info

## Quick Reference Commands

```bash
# Install dependencies
npm install

# Development mode
npm run dev

# Build for current platform
npm run build

# Build for specific platform
npm run build:windows
npm run build:macos
npm run build:linux

# Clean build
cd src-tauri && cargo clean && cd ..

# Update Rust
rustup update

# Update dependencies
cd src-tauri && cargo update && cd ..
