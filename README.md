# Deine Job Website - Flutter Application

A scalable, pixel-perfect Flutter web application for job recruitment platform, built following industry best practices.

## Features

- ✅ **Pixel-Perfect Design**: Exact implementation matching Figma specifications
- ✅ **Performance Optimized**: Const widgets, RepaintBoundary, ListView.builder, cached images
- ✅ **Fully Responsive**: Works seamlessly on mobile, tablet, and desktop
- ✅ **Scalable Architecture**: Clean code structure following industry standards
- ✅ **Sticky Header**: Register button stays in top bar during scroll
- ✅ **Tab Navigation**: Three views (Arbeitnehmer, Arbeitgeber, Temporärbüro)

## Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   └── spacing.dart          # Spacing tokens (8px grid)
│   ├── theme/
│   │   ├── app_colors.dart       # Color constants from design system
│   │   ├── app_typography.dart   # Typography system (Lato font)
│   │   └── app_theme.dart        # App-wide theme configuration
│   ├── utils/
│   │   └── shadow_utils.dart     # Shadow utilities from Figma
│   └── widgets/
│       ├── responsive_builder.dart      # Responsive layout utilities
│       └── repaint_boundary_wrapper.dart # Performance optimization
└── features/
    └── home/
        └── presentation/
            ├── pages/
            │   └── home_page.dart      # Main home page
            ├── providers/
            │   └── tab_provider.dart   # Tab state management
            └── widgets/
                ├── sticky_header.dart   # Sticky header with register button
                ├── hero_section.dart    # Hero section with title & illustration
                ├── gradient_button.dart # Gradient CTA button
                ├── tab_navigation.dart  # Tab navigation widget
                ├── steps_section.dart   # Steps section container
                └── step_card.dart       # Individual step card
```

## Design System

### Colors
All colors are defined in `lib/core/theme/app_colors.dart`:
- White: `#FFFFFF`
- Teal shades: `#E6FFFA`, `#319795`, `#81E6D9`
- Blue shades: `#EBF4FF`, `#3182CE`
- Gray shades: `#F7FAFC`, `#718096`, `#4A5568`, `#2D3748`, `#CBD5E0`, `#707070`
- Overlays: `#00000033`, `#00000029`

### Typography
Uses Lato font family with exact sizes:
- Display Large: 130px, Regular, `#718096`
- Headline Medium: 42px, Medium, `#2D3748`
- Title Medium: 21px, Medium, `#4A5568`
- Body Medium: 15.75px, Regular, `#718096`
- Label Small: 14px, Bold/Semibold, various colors

### Spacing
8px grid system:
- xs: 8px
- sm: 16px
- md: 24px
- lg: 32px
- xl: 40px
- xxl: 48px
- xxxl: 64px

## Performance Optimizations

1. **Const Widgets**: Used wherever possible to prevent unnecessary rebuilds
2. **RepaintBoundary**: Applied around complex widgets to isolate repaints
3. **ValueListenableBuilder**: Used for isolated state updates (tab changes)
4. **Cached Images**: Using `cached_network_image` with cacheWidth/cacheHeight
5. **Stable Keys**: Widgets use stable keys based on content IDs
6. **ListView.builder**: For scrollable lists (ready for future enhancements)

## Setup Instructions

1. **Install Flutter dependencies:**
   ```bash
   flutter pub get
   ```

2. **Add fonts (Optional but recommended for pixel-perfect design):**
   To use the exact Lato font family as specified in the design:
   - Download Lato font files (Regular, Medium, Semibold, Bold)
   - Create `assets/fonts/` directory
   - Place font files there
   - Update `pubspec.yaml` to include:
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
   - If fonts are not added, the app will use system sans-serif fonts as fallback

3. **Add assets:**
   Place your illustration images in:
   - `assets/illustrations/handshake.png`
   - `assets/illustrations/step1_arbeitnehmer.png`
   - `assets/illustrations/step2_arbeitnehmer.png`
   - `assets/illustrations/step3_arbeitnehmer.png`
   - `assets/illustrations/step1_arbeitgeber.png`
   - `assets/illustrations/step2_arbeitgeber.png`
   - `assets/illustrations/step3_arbeitgeber.png`
   - `assets/illustrations/step1_temporarburo.png`
   - `assets/illustrations/step2_temporarburo.png`
   - `assets/illustrations/step3_temporarburo.png`
   
   See `assets/README.md` for detailed asset requirements.

4. **Run the app:**
   ```bash
   flutter run -d chrome  # For web
   flutter run            # For mobile
   ```

## Responsive Breakpoints

- Mobile: < 600px
- Tablet: 600px - 1200px
- Desktop: >= 1200px

## Best Practices Implemented

- ✅ Custom widget library based on design tokens
- ✅ MediaQuery and LayoutBuilder for responsive ratios
- ✅ Custom shadows matching Figma CSS exports
- ✅ Custom typography system with exact fonts
- ✅ Isolated state management with ValueNotifier
- ✅ Performance-first approach with RepaintBoundary
- ✅ Scalable folder structure
- ✅ Const constructors where applicable

## Notes

- The app uses placeholder images with fallback UI if assets are not found
- All widgets are optimized for smooth scrolling performance
- The sticky header maintains the register button visibility during scroll
- Tab switching is optimized to only rebuild necessary widgets

