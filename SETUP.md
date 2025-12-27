# Setup Guide

## Quick Start

1. **Ensure Flutter is installed:**
   ```bash
   flutter --version
   ```
   Should be Flutter 3.0.0 or higher.

2. **Get dependencies:**
   ```bash
   flutter pub get
   ```

3. **Add your assets:**
   - Place all illustration images in `assets/illustrations/` directory
   - See `assets/README.md` for the complete list

4. **Run the application:**
   ```bash
   # For web (Chrome)
   flutter run -d chrome
   
   # For mobile (connected device/emulator)
   flutter run
   
   # For specific device
   flutter devices  # List available devices
   flutter run -d <device-id>
   ```

## Font Setup (Optional)

The design uses Lato font family. To match exactly:

1. Download Lato font files from [Google Fonts](https://fonts.google.com/specimen/Lato)
2. Create `assets/fonts/` directory
3. Add the following font files:
   - Lato-Regular.ttf
   - Lato-Medium.ttf
   - Lato-SemiBold.ttf
   - Lato-Bold.ttf
4. Update `pubspec.yaml`:
   ```yaml
   flutter:
     fonts:
       - family: Lato
         fonts:
           - asset: assets/fonts/Lato-Regular.ttf
           - asset: assets/fonts/Lato-Medium.ttf
             weight: 500
           - asset: assets/fonts/Lato-SemiBold.ttf
             weight: 600
           - asset: assets/fonts/Lato-Bold.ttf
             weight: 700
   ```
5. Run `flutter pub get` again

**Note:** If fonts are not added, the app will use system fonts as fallback.

## Project Structure

```
job_website/
├── lib/
│   ├── core/              # Core utilities and theme
│   │   ├── constants/     # Spacing tokens
│   │   ├── theme/         # Colors, typography, theme
│   │   ├── utils/         # Utility functions
│   │   └── widgets/       # Reusable widgets
│   ├── features/          # Feature modules
│   │   └── home/          # Home feature
│   │       └── presentation/
│   │           ├── pages/  # Page widgets
│   │           ├── providers/ # State providers
│   │           └── widgets/   # Feature widgets
│   └── main.dart          # App entry point
├── assets/
│   ├── images/            # General images
│   └── illustrations/     # Step illustrations
└── pubspec.yaml           # Dependencies
```

## Performance Features

This app implements several performance optimizations:

- ✅ Const widgets wherever possible
- ✅ RepaintBoundary for complex widgets
- ✅ ValueListenableBuilder for isolated state updates
- ✅ Cached image loading (ready for network images)
- ✅ Stable keys for list items
- ✅ Responsive design with MediaQuery/LayoutBuilder

## Troubleshooting

### Assets not showing?
- Ensure images are in correct directories
- Check file names match exactly (case-sensitive)
- Run `flutter clean` then `flutter pub get`
- Verify `pubspec.yaml` has correct asset paths

### Fonts not loading?
- Check font file paths in `pubspec.yaml`
- Ensure font files exist in `assets/fonts/`
- Run `flutter clean` then `flutter pub get`
- Restart the app

### Build errors?
- Run `flutter doctor` to check Flutter installation
- Ensure Flutter SDK version >= 3.0.0
- Run `flutter clean` and rebuild




