# Quick Start Guide 🚀

## Run the App in 3 Steps

### Step 1: Install Dependencies
```bash
flutter pub get
```

### Step 2: Check Available Devices
```bash
flutter devices
```

### Step 3: Run the App

**For Web (Recommended):**
```bash
flutter run -d chrome
```

**For Windows Desktop:**
```bash
flutter run -d windows
```

**For Android:**
```bash
flutter run
```
(Select device when prompted)

---

## What to Test

### ✅ Basic Functionality
1. **Scroll the page** - Header should stay at top
2. **Click tabs** - Content should change (Arbeitnehmer, Arbeitgeber, Temporärbüro)
3. **Check responsive** - Resize browser window to see mobile/tablet/desktop layouts

### ✅ Visual Elements
- Hero section with title and illustration
- Gradient "Kostenlos Registrieren" button
- Step cards with numbers and illustrations
- Tab navigation buttons

### ✅ Performance
- Smooth scrolling (no jank)
- Fast tab switching
- Images load quickly

---

## Troubleshooting

**If you see errors:**
```bash
flutter clean
flutter pub get
flutter run -d chrome
```

**If assets don't load:**
- Check that files exist in `assets/images/`
- Verify `pubspec.yaml` has asset paths
- Run `flutter clean` and rebuild

**If Chrome doesn't open:**
- Make sure Chrome is installed
- Try: `flutter run -d windows` instead

---

## Hot Reload Tips

While app is running:
- Press `r` = Hot reload (fast)
- Press `R` = Hot restart (full restart)
- Press `q` = Quit app

---

## Need More Help?

See `HOW_TO_RUN.md` for detailed instructions and testing checklist.




