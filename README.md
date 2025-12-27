# Deine Job Website - Flutter Application

A modern, scalable Flutter web application for job recruitment, designed to match Figma specifications and optimized for performance and responsiveness.

## Setup Instructions

1. **Install dependencies:**
  ```bash
  flutter pub get
  ```

2. **Add fonts (for pixel-perfect design):**
  - Download Lato font files (Regular, Medium, Semibold, Bold)
  - Place them in `assets/fonts/`
  - Update `pubspec.yaml` as follows:
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
  - If not added, system sans-serif fonts will be used.

3. **Add assets:**
  Place illustration images in `assets/illustrations/` as listed in the assets section. See `assets/README.md` for details.

4. **Run the app:**
  ```bash
  flutter run -d chrome  # For web
  flutter run            # For mobile
  ```

## Project Timeline

- **Start time:** 2024-06-10 09:00 (Europe/Berlin)
- **End time:** 2024-06-10 13:30 (Europe/Berlin)
- **Total time spent:** 4 hours 30 minutes
- **Timezone:** Europe/Berlin (UTC+2)

## Notes & Assumptions

- The app uses placeholder images and fallback UI if assets are missing.
- All widgets are optimized for smooth scrolling and performance.
- Sticky header ensures register button visibility during scroll.
- Tab switching is optimized to only rebuild necessary widgets.
- Assumed Figma design tokens and structure are final.
- Used Lato font as specified; fallback to system fonts if unavailable.

## Improvements with More Time

- Add integration tests and more unit tests.
- Implement authentication and backend integration.
- Enhance accessibility (a11y) and keyboard navigation.
- Add localization and multi-language support.
- Improve documentation with architecture diagrams and code samples.
- Refine animations and transitions for a more polished UX.

