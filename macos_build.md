# Building a macOS App with Flutter for Users

Here's a complete guide to building and distributing Flutter apps on macOS:

## 1. **Setup Flutter for macOS**

```bash
# Enable macOS desktop support
flutter config --enable-macos-desktop

# Verify setup
flutter doctor

# Create a new project (or add macOS to existing)
flutter create my_app

# Or add macOS to existing project
flutter create --platforms=macos .
```

## 2. **Development**

```bash
# Run on macOS
flutter run -d macos

# Hot reload works just like mobile!
# Press 'r' to hot reload, 'R' to hot restart
```

**Project Structure:**
```
my_app/
├── lib/               # Your Flutter code
├── macos/            # macOS-specific files
│   ├── Runner/       # Native macOS app wrapper
│   └── Runner.xcworkspace  # Open in Xcode if needed
```

## 3. **Configure Your App**

**Edit `macos/Runner/Configs/AppInfo.xcconfig`:**
```
PRODUCT_NAME = My App Name
PRODUCT_BUNDLE_IDENTIFIER = com.yourcompany.myapp
```

**App Icon:**
- Use 1024x1024 PNG
- Place in `macos/Runner/Assets.xcassets/AppIcon.appiconset/`
- Or use a tool like `flutter_launcher_icons`

**Permissions (if needed):**

Edit `macos/Runner/DebugProfile.entitlements` and `Release.entitlements`:
```xml
<key>com.apple.security.network.client</key>
<true/>
<key>com.apple.security.files.user-selected.read-write</key>
<true/>
```

Common permissions:
- `com.apple.security.network.client` - Internet access
- `com.apple.security.network.server` - Act as server
- `com.apple.security.files.user-selected.read-write` - File access
- `com.apple.security.device.camera` - Camera access
- `com.apple.security.device.microphone` - Microphone access

## 4. **Building for Release**

### **Option A: Command Line (Quick)**

```bash
# Build release version
flutter build macos --release

# Your app will be at:
# build/macos/Build/Products/Release/YourApp.app

# Create a DMG (disk image) for distribution
# First, install create-dmg:
brew install create-dmg

# Create DMG
create-dmg \
  --volname "My App Installer" \
  --window-pos 200 120 \
  --window-size 600 400 \
  --icon-size 100 \
  --icon "YourApp.app" 175 120 \
  --hide-extension "YourApp.app" \
  --app-drop-link 425 120 \
  "YourApp.dmg" \
  "build/macos/Build/Products/Release/YourApp.app"
```

### **Option B: Xcode (Full Control)**

```bash
# Open in Xcode
open macos/Runner.xcworkspace

# In Xcode:
# 1. Select "Any Mac" as destination
# 2. Product > Archive
# 3. Distribute App
```

## 5. **Code Signing (Required for Distribution)**

### **Get Apple Developer Account**
- Sign up at developer.apple.com ($99/year)
- Create certificates in Xcode or developer portal

### **Sign Your App**

**In Xcode:**
1. Open `macos/Runner.xcworkspace`
2. Select Runner project → Signing & Capabilities
3. Select your Team
4. Enable "Automatically manage signing"

**Or manually with command line:**
```bash
# Sign the app
codesign --deep --force --verify --verbose \
  --sign "Developer ID Application: Your Name (TEAM_ID)" \
  "build/macos/Build/Products/Release/YourApp.app"

# Verify signing
codesign --verify --deep --strict --verbose=2 \
  "build/macos/Build/Products/Release/YourApp.app"
```

## 6. **Notarization (Prevents Security Warnings)**

```bash
# 1. Create a ZIP of your app
ditto -c -k --sequesterRsrc --keepParent \
  "build/macos/Build/Products/Release/YourApp.app" \
  "YourApp.zip"

# 2. Submit for notarization
xcrun notarytool submit YourApp.zip \
  --apple-id your@email.com \
  --team-id YOUR_TEAM_ID \
  --password YOUR_APP_SPECIFIC_PASSWORD \
  --wait

# 3. Staple the notarization ticket
xcrun stapler staple "build/macos/Build/Products/Release/YourApp.app"

# 4. Create final DMG with stapled app
create-dmg --volname "My App" YourApp.dmg \
  "build/macos/Build/Products/Release/YourApp.app"
```

**App-Specific Password:**
1. Go to appleid.apple.com
2. Sign in
3. Security → App-Specific Passwords → Generate

## 7. **Common Issues & Solutions**

### **"App is damaged" error:**
- App needs to be code signed and notarized
- Users can temporarily bypass: `xattr -cr /path/to/YourApp.app`

### **Entitlements errors:**
- Check `macos/Runner/DebugProfile.entitlements`
- Make sure they match what your app needs

### **Building fails:**
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter build macos --release
```

### **Universal Binary (Intel + Apple Silicon):**
Flutter automatically builds universal binaries by default since Flutter 3.0!

Verify with:
```bash
lipo -archs build/macos/Build/Products/Release/YourApp.app/Contents/MacOS/YourApp
# Should show: x86_64 arm64
```

## 8. **Distribution Options**

### **Direct Distribution (Recommended for most)**
1. Build and notarize your app
2. Create a DMG
3. Host on your website
4. Users download and install

**Pros:** No commission, full control, faster updates
**Cons:** Need payment system, handle updates yourself

### **Mac App Store**
1. Configure in Xcode for App Store
2. Enable sandboxing (more restrictions)
3. Submit through App Store Connect
4. Wait for review (1-3 days typically)

**Pros:** Built-in discovery, automatic updates, trusted
**Cons:** 30% commission, strict review, sandboxing limitations

## 9. **Auto-Updates (For Direct Distribution)**

Use package `package_info_plus` and `url_launcher`:

```yaml
dependencies:
  package_info_plus: ^8.0.0
  url_launcher: ^6.3.0
  http: ^1.2.0
```

```dart
Future<void> checkForUpdates() async {
  PackageInfo info = await PackageInfo.fromPlatform();
  String currentVersion = info.version;
  
  // Check your server for latest version
  final response = await http.get(
    Uri.parse('https://yoursite.com/api/latest-version')
  );
  
  String latestVersion = jsonDecode(response.body)['version'];
  
  if (latestVersion != currentVersion) {
    // Show update dialog
    // Direct to download page
  }
}
```

Or use Sparkle framework (requires some native integration).

## 10. **Complete Release Script**


**To use the script:**
1. Save as `build_release.sh`
2. Edit the configuration variables at the top
3. Make executable: `chmod +x build_release.sh`
4. Run: `./build_release.sh`

## 11. **Quick Start Checklist**

For your first release:

- [ ] `flutter config --enable-macos-desktop`
- [ ] Update app name and bundle ID in `macos/Runner/Configs/AppInfo.xcconfig`
- [ ] Add app icon (1024x1024 PNG)
- [ ] Set required entitlements
- [ ] Get Apple Developer account
- [ ] `flutter build macos --release`
- [ ] Code sign the app
- [ ] Notarize with Apple
- [ ] Create DMG
- [ ] Test on another Mac
- [ ] Distribute!

## 12. **Testing Before Release**

```bash
# Test the built app
open build/macos/Build/Products/Release/YourApp.app

# Test on different macOS versions (if possible)
# Test on both Intel and Apple Silicon Macs

# Verify codesigning
codesign -dv --verbose=4 YourApp.app

# Verify notarization
spctl -a -vv YourApp.app
```

Need help with any specific step? Let me know!


# Certificates for Direct Distribution of Flutter macOS Apps

For distributing a Flutter macOS app **outside the Mac App Store**, you need:

## Required Certificate

**Developer ID Application Certificate**
- This is the primary certificate you need
- Allows users to run your app outside the App Store
- Enables Gatekeeper to verify your app is from an identified developer
- Requires a paid Apple Developer account ($99/year)

## How to Get It

### 1. **Join Apple Developer Program**
- Go to https://developer.apple.com
- Enroll as an individual or organization
- Pay $99/year fee

### 2. **Create the Certificate**

**Option A - Using Xcode (Easiest):**
1. Open Xcode
2. Go to Xcode → Settings → Accounts
3. Add your Apple ID (Developer account)
4. Select your team
5. Click "Manage Certificates"
6. Click the "+" button
7. Choose **"Developer ID Application"**

**Option B - Using Apple Developer Portal:**
1. Go to https://developer.apple.com/account/resources/certificates
2. Click the "+" button to create a certificate
3. Select **"Developer ID Application"**
4. Follow the instructions to create a Certificate Signing Request (CSR)
5. Upload CSR and download the certificate
6. Double-click to install in Keychain

### 3. **Verify Installation**
```bash
# List all certificates
security find-identity -v -p codesigning

# You should see something like:
# "Developer ID Application: Your Name (TEAM_ID)"
```

## Building Your Flutter App

### 1. **Configure in Xcode**

Open your Flutter project's macOS runner:
```bash
open macos/Runner.xcworkspace
```

In Xcode:
1. Select "Runner" project
2. Select "Runner" target
3. Go to "Signing & Capabilities" tab
4. **Uncheck** "Automatically manage signing"
5. Select your Developer ID Application certificate
6. Under "Hardened Runtime", enable required capabilities

### 2. **Build Release Version**

```bash
# Build the app
flutter build macos --release

# Your app will be in:
# build/macos/Build/Products/Release/YourApp.app
```

### 3. **Code Sign the App**

```bash
# Sign the app bundle
codesign --deep --force --verify --verbose \
  --sign "Developer ID Application: Your Name (TEAM_ID)" \
  --options runtime \
  build/macos/Build/Products/Release/YourApp.app

# Verify signature
codesign --verify --verbose build/macos/Build/Products/Release/YourApp.app
```

### 4. **Notarize the App**

This is **required** for macOS 10.15+ users to open your app without warnings:

```bash
# Create a ZIP archive
ditto -c -k --keepParent \
  build/macos/Build/Products/Release/YourApp.app \
  YourApp.zip

# Submit for notarization (requires app-specific password)
xcrun notarytool submit YourApp.zip \
  --apple-id your@email.com \
  --password "your-app-specific-password" \
  --team-id YOUR_TEAM_ID \
  --wait

# After approval, staple the ticket to the app
xcrun stapler staple build/macos/Build/Products/Release/YourApp.app
```

### 5. **Create App-Specific Password**
1. Go to https://appleid.apple.com
2. Sign in
3. Security → App-Specific Passwords
4. Generate new password
5. Use this for notarization (not your Apple ID password)

## What You DON'T Need

❌ **Mac App Distribution Certificate** - This is only for App Store
❌ **Mac Installer Distribution Certificate** - Only if creating PKG installers for App Store
❌ **Provisioning Profiles** - Not needed for macOS (unlike iOS)

## Additional Configuration

### Update `macos/Runner/DebugProfile.entitlements`:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>com.apple.security.app-sandbox</key>
    <false/>
    <key>com.apple.security.network.client</key>
    <true/>
    <!-- Add other entitlements as needed -->
</dict>
</plist>
```

Copy this to `Release.entitlements` as well.

## Common Issues

**"No identity found"**
- Make sure certificate is installed in Keychain
- Check it's the "Developer ID Application" type

**"The application cannot be opened"**
- App not notarized (required for macOS 10.15+)
- Or not properly code signed

**Notarization fails**
- Check Hardened Runtime is enabled
- Verify all embedded frameworks are signed
- Use `--options runtime` when signing

## Quick Summary

1. **Pay** for Apple Developer Program ($99/year)
2. **Create** Developer ID Application certificate
3. **Build** Flutter app with `flutter build macos --release`
4. **Sign** the app with your certificate
5. **Notarize** through Apple's notary service
6. **Distribute** via DMG, ZIP, or direct download

The key certificate is **Developer ID Application** - that's the only one you need for direct distribution!
