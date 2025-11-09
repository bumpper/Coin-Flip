# coinflip Project Directory Structure

```
coinflip/
│
├── 📄 START_HERE.md              ⭐ Begin here! Quick start guide
├── 📄 README.md                   Project overview and quick reference
├── 📄 SETUP.md                    Detailed setup and prerequisites
├── 📄 BUILD_INSTRUCTIONS.md       Comprehensive build guide
├── 📄 PROJECT_SUMMARY.md          Complete technical overview
├── 📄 CHECKLIST.md                Step-by-step completion checklist
├── 📄 DIRECTORY_STRUCTURE.md      This file - project structure
│
├── 📄 package.json                Node.js project configuration
├── 📄 package-lock.json           Dependency lock file
├── 📄 .gitignore                  Git ignore rules
├── 📄 Cargo.toml                  Root Cargo configuration
│
├── 🔧 quick-dev.bat               Windows: Quick development mode
├── 🔧 quick-build.bat             Windows: Quick build script
│
├── 📁 src/                        Frontend Assets
│   ├── 📄 index.html              Main application HTML
│   ├── 🖼️ heads.png               Heads coin image
│   ├── 🖼️ tails.png               Tails coin image
│   └── 🔊 coinflip.mp3            Coin flip sound effect
│
├── 📁 src-tauri/                  Rust Backend
│   ├── 📄 Cargo.toml              Rust dependencies
│   ├── 📄 tauri.conf.json         Tauri configuration
│   ├── 📄 build.rs                Build script
│   │
│   ├── 📁 src/                    Rust source code
│   │   └── 📄 main.rs             Application entry point
│   │
│   ├── 📁 icons/                  Application icons
│   │   ├── 🖼️ 32x32.png           32x32 icon
│   │   ├── 🖼️ 128x128.png         128x128 icon
│   │   ├── 🖼️ 128x128@2x.png      256x256 icon (retina)
│   │   ├── 🖼️ icon.ico            Windows icon
│   │   ├── 🖼️ icon.icns           macOS icon
│   │   └── 🖼️ icon.png            Source icon
│   │
│   └── 📁 target/                 Build output (created after build)
│       └── 📁 release/
│           └── 📁 bundle/         Installers location
│               ├── 📁 nsis/       Windows NSIS installer
│               ├── 📁 msi/        Windows MSI installer
│               ├── 📁 dmg/        macOS DMG image
│               ├── 📁 macos/      macOS app bundle
│               ├── 📁 deb/        Linux DEB package
│               └── 📁 rpm/        Linux RPM package
│
└── 📁 node_modules/               Node.js dependencies (created after npm install)
    └── 📁 @tauri-apps/
        └── 📁 cli/                Tauri CLI tools
```

## Key Files Explained

### Documentation Files

| File | Purpose | When to Read |
|------|---------|--------------|
| **START_HERE.md** | Quick start guide | First time setup |
| **README.md** | Project overview | General reference |
| **SETUP.md** | Detailed setup instructions | Before building |
| **BUILD_INSTRUCTIONS.md** | Build guide for all platforms | When creating installers |
| **PROJECT_SUMMARY.md** | Technical overview | Understanding the project |
| **CHECKLIST.md** | Completion checklist | Tracking progress |
| **DIRECTORY_STRUCTURE.md** | This file | Understanding structure |

### Configuration Files

| File | Purpose | Edit When |
|------|---------|-----------|
| **package.json** | Node.js configuration | Changing version, scripts |
| **src-tauri/Cargo.toml** | Rust dependencies | Adding Rust packages |
| **src-tauri/tauri.conf.json** | Tauri settings | Changing app config |
| **src-tauri/build.rs** | Build script | Custom build steps |
| **.gitignore** | Git ignore rules | Adding ignore patterns |

### Source Files

| File | Purpose | Edit When |
|------|---------|-----------|
| **src/index.html** | Main UI | Changing interface |
| **src-tauri/src/main.rs** | Rust backend | Adding backend features |
| **src/*.png** | Images | Replacing graphics |
| **src/*.mp3** | Audio | Replacing sounds |

### Build Scripts (Windows)

| File | Purpose | When to Use |
|------|---------|-------------|
| **quick-dev.bat** | Start development mode | Testing during development |
| **quick-build.bat** | Build installers | Creating distribution packages |

## Build Output Structure

After running `npm run build`, the following structure is created:

```
src-tauri/target/release/bundle/
│
├── 📁 nsis/                       Windows NSIS Installer
│   └── 📦 coinflip_1.0.0_x64-setup.exe
│
├── 📁 msi/                        Windows MSI Installer
│   └── 📦 coinflip_1.0.0_x64_en-US.msi
│
├── 📁 dmg/                        macOS Disk Image
│   └── 📦 coinflip_1.0.0_x64.dmg
│
├── 📁 macos/                      macOS App Bundle
│   └── 📦 coinflip.app
│
├── 📁 deb/                        Linux Debian Package
│   └── 📦 coinflip_1.0.0_amd64.deb
│
└── 📁 rpm/                        Linux RPM Package
    └── 📦 coinflip-1.0.0-1.x86_64.rpm
```

## Installation Paths

After installation, the application is located at:

### Windows (NSIS)
```
%LOCALAPPDATA%\Programs\coinflip\
├── coinflip.exe
├── resources/
└── uninstall.exe
```

### Windows (MSI)
```
C:\Program Files\coinflip\
├── coinflip.exe
└── resources/
```

### macOS
```
/Applications/coinflip.app/
├── Contents/
│   ├── MacOS/
│   │   └── coinflip
│   ├── Resources/
│   └── Info.plist
```

### Linux
```
/usr/bin/coinflip                           (binary)
/usr/share/applications/coinflip.desktop    (desktop entry)
/usr/share/icons/hicolor/*/apps/coinflip.*  (icons)
```

## Development Workflow

```
1. Edit source files
   └── src/index.html (frontend)
   └── src-tauri/src/main.rs (backend)

2. Test changes
   └── npm run dev

3. Build installers
   └── npm run build

4. Test installers
   └── Install and test on target platform

5. Distribute
   └── Share installers with users
```

## File Size Reference

Approximate sizes after build:

| File | Size |
|------|------|
| NSIS Installer (.exe) | ~5-8 MB |
| MSI Installer (.msi) | ~5-8 MB |
| DMG Image (.dmg) | ~5-8 MB |
| DEB Package (.deb) | ~5-8 MB |
| RPM Package (.rpm) | ~5-8 MB |

*Sizes may vary based on dependencies and optimizations*

## Important Directories

### Do NOT Edit
- `node_modules/` - Managed by npm
- `src-tauri/target/` - Build output
- `.git/` - Git repository data

### Safe to Edit
- `src/` - Frontend files
- `src-tauri/src/` - Backend code
- `src-tauri/icons/` - Application icons
- Documentation files (*.md)

### Configuration Files (Edit Carefully)
- `package.json` - Node.js config
- `src-tauri/Cargo.toml` - Rust config
- `src-tauri/tauri.conf.json` - Tauri config

## Quick Navigation

- **Start developing**: Open `START_HERE.md`
- **Setup help**: Open `SETUP.md`
- **Build help**: Open `BUILD_INSTRUCTIONS.md`
- **Technical details**: Open `PROJECT_SUMMARY.md`
- **Track progress**: Open `CHECKLIST.md`
- **Quick start (Windows)**: Run `quick-dev.bat`

---

**Tip**: Keep this file open as a reference while working on the project!
