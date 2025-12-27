# How to Run and Test the App

## Prerequisites

1. **Install Flutter** (if not already installed):
   - Download from: https://flutter.dev/docs/get-started/install
   - Verify installation: `flutter doctor`

2. **Check Flutter Setup**:
   ```bash
   flutter doctor
   ```
   Make sure all required components are installed (Android Studio, VS Code, Chrome, etc.)

## Step-by-Step Instructions

### 1. Install Dependencies

Open terminal in the project root and run:

```bash
flutter pub get
```

This will download all required packages (flutter_svg, cached_network_image, etc.)

### 2. Check Available Devices

```bash
flutter devices
```

You should see available devices like:
- Chrome (web)
- Windows (desktop)
- Android Emulator (if running)
- Physical device (if connected)

### 3. Run the App

#### Option A: Run on Web (Chrome) - Recommended for Testing
```bash
flutter run -d chrome
```

#### Option B: Run on Windows Desktop
```bash
flutter run -d windows
```

#### Option C: Run on Android Emulator/Device
```bash
flutter run
```
(Select the device when prompted)

#### Option D: Run on iOS Simulator (Mac only)
```bash
flutter run -d ios
```

### 4. Hot Reload During Development

While the app is running:
- Press `r` in the terminal to hot reload
- Press `R` to hot restart
- Press `q` to quit

### 5. Build for Production

#### Web Build:
```bash
flutter build web
```
Output will be in `build/web/` directory

#### Windows Build:
```bash
flutter build windows
```

#### Android APK:
```bash
flutter build apk
```

## Testing Checklist

### ✅ Visual Testing

1. **Sticky Header**:
   - [ ] Header stays at top when scrolling
   - [ ] "Kostenlos Registrieren" button is always visible
   - [ ] Shadow appears when scrolled down

2. **Hero Section**:
   - [ ] Title "Deine Job website" displays correctly
   - [ ] Handshake illustration shows (or placeholder)
   - [ ] Gradient button displays with correct colors

3. **Tab Navigation**:
   - [ ] Three tabs visible: Arbeitnehmer, Arbeitgeber, Temporärbüro
   - [ ] Clicking tabs changes content
   - [ ] Active tab is highlighted

4. **Steps Section**:
   - [ ] Steps display correctly for each tab
   - [ ] Step numbers (1., 2., 3.) are visible
   - [ ] Illustrations load (SVG files)
   - [ ] Titles match the selected tab

5. **Responsive Design**:
   - [ ] Test on mobile viewport (< 600px)
   - [ ] Test on tablet viewport (600-1200px)
   - [ ] Test on desktop viewport (> 1200px)
   - [ ] Layout adapts correctly to screen size

### ✅ Functionality Testing

1. **Scrolling**:
   - [ ] Page scrolls smoothly
   - [ ] Header remains sticky
   - [ ] No performance issues during scroll

2. **Tab Switching**:
   - [ ] Content updates when switching tabs
   - [ ] No flickering or layout shifts
   - [ ] Illustrations load correctly

3. **Buttons**:
   - [ ] "Login" button is clickable
   - [ ] "Kostenlos Registrieren" button is clickable
   - [ ] Hover effects work (on web)

### ✅ Performance Testing

1. **Scroll Performance**:
   - [ ] Smooth scrolling (60 FPS)
   - [ ] No jank or stuttering
   - [ ] Images load efficiently

2. **Memory Usage**:
   - [ ] No memory leaks
   - [ ] Images are cached properly

## Debugging

### View Logs
```bash
flutter run -d chrome --verbose
```

### Check for Errors
```bash
flutter analyze
```

### Clean Build
If you encounter issues:
```bash
flutter clean
flutter pub get
flutter run
```

## Common Issues & Solutions

### Issue: "No devices found"
**Solution**: 
- For web: Make sure Chrome is installed
- For Android: Start an emulator or connect a device
- Run `flutter doctor` to check setup

### Issue: "Assets not found"
**Solution**:
- Check `pubspec.yaml` has correct asset paths
- Run `flutter clean` then `flutter pub get`
- Verify files exist in `assets/images/` directory

### Issue: "SVG not rendering"
**Solution**:
- Ensure `flutter_svg` package is installed: `flutter pub get`
- Check SVG file paths are correct
- Verify SVG files are valid

### Issue: "Build errors"
**Solution**:
- Run `flutter doctor` to check Flutter setup
- Ensure Flutter SDK version >= 3.0.0
- Run `flutter clean` and rebuild

## Testing on Different Screen Sizes

### Chrome DevTools (Recommended)
1. Run: `flutter run -d chrome`
2. Open Chrome DevTools (F12)
3. Click device toolbar icon (Ctrl+Shift+M)
4. Test different device presets:
   - iPhone SE (375px)
   - iPhone 12 Pro (390px)
   - iPad (768px)
   - Desktop (1920px)

### Manual Viewport Testing
Resize browser window to test:
- Mobile: < 600px width
- Tablet: 600-1200px width
- Desktop: > 1200px width

## Performance Profiling

### Enable Performance Overlay
Add to `main.dart`:
```dart
MaterialApp(
  showPerformanceOverlay: true, // Add this
  // ... rest of config
)
```

### Check Frame Rendering
- Green bars = good performance
- Red bars = performance issues
- Target: 60 FPS (16ms per frame)

## Next Steps After Testing

1. ✅ Verify all assets load correctly
2. ✅ Test on multiple devices/browsers
3. ✅ Check responsive behavior
4. ✅ Verify performance is smooth
5. ✅ Test all interactive elements
6. ✅ Check for any console errors

## Quick Commands Reference

```bash
# Install dependencies
flutter pub get

# Run on Chrome
flutter run -d chrome

# Run on Windows
flutter run -d windows

# Check for issues
flutter analyze

# Clean build
flutter clean

# Build for web
flutter build web

# Check Flutter setup
flutter doctor
```

Happy testing! 🚀




