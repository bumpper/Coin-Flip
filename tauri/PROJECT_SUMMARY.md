# coinflip Tauri Application - Project Summary

## Overview

The coinflip HTML application has been successfully converted into a cross-platform desktop application using Tauri. This application can now be built as native installers for Windows, macOS, and Linux.

## Project Structure

```
coinflip/
├── src/                          # Frontend assets
│   ├── index.html               # Main application HTML
│   ├── heads.png                # Heads coin image
│   ├── tails.png                # Tails coin image
│   └── coinflip.mp3             # Coin flip sound effect
│
├── src-tauri/                    # Rust backend
│   ├── src/
│   │   └── main.rs              # Tauri application entry point
│   ├── icons/                   # Application icons (all sizes)
│   │   ├── 32x32.png
│   │   ├── 128x128.png
│   │   ├── 128x128@2x.png
│   │   ├── icon.ico             # Windows icon
│   │   ├── icon.icns            # macOS icon
│   │   └── icon.png             # Source icon
│   ├── Cargo.toml               # Rust dependencies
│   ├── tauri.conf.json          # Tauri configuration
│   └── build.rs                 # Build script
│
├── package.json                  # Node.js project configuration
├── .gitignore                   # Git ignore rules
├── README.md                    # Project overview and quick start
├── SETUP.md                     # Detailed setup instructions
└── BUILD_INSTRUCTIONS.md        # Comprehensive build guide
```

## Features Preserved

All original features from the HTML application have been preserved:

✅ Interactive coin flip with animation
✅ Prediction selection (Heads/Tails)
✅ Statistics tracking (correct predictions)
✅ Dark mode toggle
✅ Local storage for preferences
✅ Sound effects
✅ Responsive design

## Platform Support

### Windows
- **Installers**: NSIS (.exe) and MSI (.msi)
- **Install Path**: `%LOCALAPPDATA%\Programs\coinflip\` (NSIS) or `C:\Program Files\coinflip\` (MSI)
- **Requirements**: Windows 10/11, WebView2 Runtime

### macOS
- **Installers**: DMG (.dmg) and App Bundle (.app)
- **Install Path**: `/Applications/coinflip.app`
- **Requirements**: macOS 10.13 or later

### Linux
- **Installers**: DEB (.deb) and RPM (.rpm)
- **Install Path**: `/usr/bin/coinflip` (binary)
- **Requirements**: WebKit2GTK 4.1

## Installation Directory Structure

The application installs to a subdirectory called "coinflip" in the default location for each OS:

| Platform | Base Directory | Subdirectory | Full Path |
|----------|---------------|--------------|-----------|
| Windows (NSIS) | `%LOCALAPPDATA%\Programs\` | `coinflip\` | `%LOCALAPPDATA%\Programs\coinflip\` |
| Windows (MSI) | `C:\Program Files\` | `coinflip\` | `C:\Program Files\coinflip\` |
| macOS | `/Applications/` | `coinflip.app` | `/Applications/coinflip.app` |
| Linux | `/usr/bin/` | N/A | `/usr/bin/coinflip` |

## Quick Start

### 1. Install Dependencies
```bash
cd coinflip
npm install
```

### 2. Run in Development Mode
```bash
npm run dev
```

### 3. Build Installers
```bash
npm run build
```

## Build Output Locations

After running `npm run build`, installers will be created in:

### Windows
- `src-tauri/target/release/bundle/nsis/coinflip_1.0.0_x64-setup.exe`
- `src-tauri/target/release/bundle/msi/coinflip_1.0.0_x64_en-US.msi`

### macOS
- `src-tauri/target/release/bundle/dmg/coinflip_1.0.0_x64.dmg`
- `src-tauri/target/release/bundle/macos/coinflip.app`

### Linux
- `src-tauri/target/release/bundle/deb/coinflip_1.0.0_amd64.deb`
- `src-tauri/target/release/bundle/rpm/coinflip-1.0.0-1.x86_64.rpm`

## Key Configuration Files

### tauri.conf.json
- Application metadata (name, version, identifier)
- Window configuration (size, title, resizable)
- Bundle settings (icon paths, installer options)
- Platform-specific settings

### Cargo.toml (src-tauri/)
- Rust dependencies (Tauri 2.0)
- Build optimization settings
- Package metadata

### package.json
- Node.js dependencies (@tauri-apps/cli)
- Build scripts for different platforms
- Project metadata

## Dependencies

### Runtime Dependencies
- **Tauri**: 2.0 (Rust framework)
- **tauri-plugin-shell**: 2.0 (Shell plugin)
- **serde**: 1.0 (Serialization)
- **serde_json**: 1.0 (JSON support)

### Development Dependencies
- **@tauri-apps/cli**: 2.0 (Build tooling)
- **tauri-build**: 2.0 (Build scripts)

### System Dependencies
- **Rust**: 1.70+ (Backend language)
- **Node.js**: 16+ (Build tooling)
- **Platform-specific**: WebView2 (Windows), WebKit2GTK (Linux)

## Build Process

1. **Frontend**: HTML/CSS/JS files are bundled from `src/` directory
2. **Backend**: Rust code is compiled with optimizations
3. **Assets**: Icons and resources are embedded
4. **Packaging**: Platform-specific installers are created
5. **Output**: Installers placed in `src-tauri/target/release/bundle/`

## Security Features

- **Content Security Policy**: Configured in tauri.conf.json
- **Asset Protocol**: Secure asset loading
- **No Remote Code**: All code is bundled and local
- **Sandboxed**: Runs in WebView sandbox

## Performance Optimizations

- **Release Profile**: Optimized for size and speed
- **LTO**: Link-time optimization enabled
- **Strip**: Debug symbols removed
- **Codegen Units**: Set to 1 for maximum optimization

## Testing Checklist

Before distribution, test:

- ✅ Coin flip animation works smoothly
- ✅ Sound plays correctly
- ✅ Statistics track accurately
- ✅ Dark mode toggles properly
- ✅ Preferences persist after restart
- ✅ Window resizes correctly
- ✅ Application installs without errors
- ✅ Application uninstalls cleanly

## Distribution

### Windows
- Distribute `.exe` (NSIS) for most users
- Distribute `.msi` for enterprise/IT departments
- Consider code signing for better trust

### macOS
- Distribute `.dmg` file
- Consider notarization for Gatekeeper
- Code signing recommended

### Linux
- Distribute both `.deb` and `.rpm`
- Consider publishing to package repositories
- AppImage could be added for universal compatibility

## Version Management

To update the version:

1. Update `package.json` → `version` field
2. Update `src-tauri/Cargo.toml` → `version` field
3. Update `src-tauri/tauri.conf.json` → `version` field
4. Rebuild: `npm run build`

## Troubleshooting Resources

- **SETUP.md**: Detailed setup and troubleshooting guide
- **BUILD_INSTRUCTIONS.md**: Comprehensive build documentation
- **README.md**: Quick start and overview
- **Tauri Docs**: https://tauri.app/
- **Tauri Discord**: https://discord.gg/tauri

## Next Steps

1. ✅ Test the application in development mode
2. ✅ Build installers for target platforms
3. ✅ Test installers on clean systems
4. ✅ Consider code signing (Windows/macOS)
5. ✅ Create distribution strategy
6. ✅ Set up update mechanism (optional)
7. ✅ Publish to users

## License

MIT License - Copyright © 2025 Radius.Center

## Credits

- **Original Application**: Radius.Center
- **Framework**: Tauri (https://tauri.app/)
- **Conversion**: Tauri desktop application wrapper

---

**Project Status**: ✅ Ready for building and distribution

**Last Updated**: 2025-10-08
