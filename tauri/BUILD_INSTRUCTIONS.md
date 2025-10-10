# Build Instructions for coinflip

This document provides detailed instructions for building the coinflip application for different platforms.

## Quick Start

1. **Install Dependencies**
   ```bash
   npm install
   ```

2. **Test in Development Mode**
   ```bash
   npm run dev
   ```

3. **Build for Your Platform**
   ```bash
   npm run build
   ```

## Building Installers

### Windows Installers

The build process will create two types of Windows installers:

1. **NSIS Installer (.exe)** - Modern installer with custom UI
   - Location: `src-tauri/target/release/bundle/nsis/coinflip_1.0.0_x64-setup.exe`
   - Default install path: `%LOCALAPPDATA%\Programs\coinflip\` (per-user)
   - Features: Uninstaller, Start Menu shortcuts, Desktop shortcut option

2. **MSI Installer (.msi)** - Windows Installer package
   - Location: `src-tauri/target/release/bundle/msi/coinflip_1.0.0_x64_en-US.msi`
   - Default install path: `C:\Program Files\coinflip\` (system-wide, requires admin)
   - Features: Windows Installer database, Group Policy deployment support

**Build Command:**
```bash
npm run build
```

### macOS Installers

The build process creates:

1. **DMG Image (.dmg)** - Disk image for distribution
   - Location: `src-tauri/target/release/bundle/dmg/coinflip_1.0.0_x64.dmg`
   - Users drag the app to Applications folder
   - Default install path: `/Applications/coinflip.app`

2. **App Bundle (.app)** - macOS application bundle
   - Location: `src-tauri/target/release/bundle/macos/coinflip.app`
   - Can be distributed directly or via DMG

**Build Command:**
```bash
npm run build
```

**Note:** For distribution outside the App Store, you'll need to sign the app with an Apple Developer certificate.

### Linux Installers

The build process creates:

1. **DEB Package (.deb)** - For Debian/Ubuntu-based distributions
   - Location: `src-tauri/target/release/bundle/deb/coinflip_1.0.0_amd64.deb`
   - Install command: `sudo dpkg -i coinflip_1.0.0_amd64.deb`
   - Binary location: `/usr/bin/coinflip`
   - Desktop entry: `/usr/share/applications/coinflip.desktop`

2. **RPM Package (.rpm)** - For Fedora/RHEL-based distributions
   - Location: `src-tauri/target/release/bundle/rpm/coinflip-1.0.0-1.x86_64.rpm`
   - Install command: `sudo rpm -i coinflip-1.0.0-1.x86_64.rpm`
   - Binary location: `/usr/bin/coinflip`
   - Desktop entry: `/usr/share/applications/coinflip.desktop`

**Build Command:**
```bash
npm run build
```

## Installation Paths Summary

| Platform | Default Installation Path | Subdirectory |
|----------|--------------------------|--------------|
| Windows (NSIS) | `%LOCALAPPDATA%\Programs\` | `coinflip\` |
| Windows (MSI) | `C:\Program Files\` | `coinflip\` |
| macOS | `/Applications/` | `coinflip.app` |
| Linux | `/usr/bin/` | `coinflip` (binary) |

## Cross-Platform Building

### Prerequisites for Cross-Compilation

**Building Windows from Linux:**
```bash
# Install MinGW
sudo apt-get install mingw-w64

# Add Windows target
rustup target add x86_64-pc-windows-gnu
```

**Building Linux from Windows:**
```bash
# Install WSL2 with Ubuntu
# Then install Linux dependencies inside WSL

# Add Linux target
rustup target add x86_64-unknown-linux-gnu
```

**Building macOS:**
- macOS builds require a macOS machine or macOS VM
- Cross-compilation to macOS is complex and not officially supported

## Troubleshooting

### Missing Dependencies

**Windows:**
- Install Visual Studio Build Tools
- Install WebView2 Runtime (usually pre-installed on Windows 10/11)

**Linux:**
```bash
# Debian/Ubuntu
sudo apt install libwebkit2gtk-4.1-dev build-essential curl wget file libxdo-dev libssl-dev libayatana-appindicator3-dev librsvg2-dev

# Fedora
sudo dnf install webkit2gtk4.1-devel openssl-devel curl wget file libappindicator-gtk3-devel librsvg2-devel
```

**macOS:**
```bash
xcode-select --install
```

### Build Errors

1. **Clear build cache:**
   ```bash
   cd src-tauri
   cargo clean
   cd ..
   ```

2. **Update Rust:**
   ```bash
   rustup update
   ```

3. **Update dependencies:**
   ```bash
   cd src-tauri
   cargo update
   cd ..
   npm install
   ```

### Icon Issues

If you get icon-related errors, ensure all icon files exist in `src-tauri/icons/`:
- 32x32.png
- 128x128.png
- 128x128@2x.png
- icon.icns (macOS)
- icon.ico (Windows)

## Testing the Build

After building, test the installer:

**Windows:**
```bash
# Run the NSIS installer
.\src-tauri\target\release\bundle\nsis\coinflip_1.0.0_x64-setup.exe
```

**macOS:**
```bash
# Open the DMG
open src-tauri/target/release/bundle/dmg/coinflip_1.0.0_x64.dmg
```

**Linux (DEB):**
```bash
sudo dpkg -i src-tauri/target/release/bundle/deb/coinflip_1.0.0_amd64.deb
coinflip
```

**Linux (RPM):**
```bash
sudo rpm -i src-tauri/target/release/bundle/rpm/coinflip-1.0.0-1.x86_64.rpm
coinflip
```

## Distribution

### Windows
- Distribute the `.exe` (NSIS) for most users
- Distribute the `.msi` for enterprise environments

### macOS
- Distribute the `.dmg` file
- Consider code signing for better user experience

### Linux
- Distribute both `.deb` and `.rpm` to cover major distributions
- Consider publishing to package repositories (AUR, PPA, etc.)

## Updating the Version

To update the version number:

1. Update `package.json`: Change the `version` field
2. Update `src-tauri/Cargo.toml`: Change the `version` field
3. Update `src-tauri/tauri.conf.json`: Change the `version` field
4. Rebuild the application

## Support

For issues or questions, refer to:
- Tauri Documentation: https://tauri.app/
- Tauri Discord: https://discord.gg/tauri
