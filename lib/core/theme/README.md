# Material 3 Theme System

## Overview

This app now uses Material 3 as the default design system with comprehensive dark/light mode support.

## Features

### ✅ Material 3 Design System

- **useMaterial3: true** - Enabled by default
- **ColorScheme Integration** - Proper Material 3 color tokens
- **Modern Components** - All Material 3 widgets supported
- **Consistent Theming** - Unified design across the entire app

### ✅ Dark/Light Mode Support

- **Automatic Color Adaptation** - Colors adapt to theme mode
- **Theme Provider** - Easy theme switching
- **System Theme Support** - Follows device theme preference

## Usage

### Accessing Theme Colors

```dart
final colorScheme = Theme.of(context).colorScheme;

// Use Material 3 color tokens
colorScheme.primary          // Primary brand color
colorScheme.onPrimary        // Text/icon color on primary
colorScheme.surface          // Surface background
colorScheme.onSurface        // Text/icon color on surface
colorScheme.outline          // Border/divider color
colorScheme.surfaceContainer // Container background
```

### Using Material 3 Components

```dart
// Buttons
FilledButton(...)           // Primary action button
FilledButton.tonal(...)     // Secondary action button
OutlinedButton(...)         // Tertiary action button
TextButton(...)             // Text-only button

// Cards
Card(...)                   // Material 3 card with proper elevation

// Input Fields
TextField(...)              // Material 3 input with proper styling

// Bottom Sheets
showModalBottomSheet(...)   // Material 3 bottom sheet with handle
```

### Theme Switching

```dart
// Get theme provider
final themeProvider = getIt<ThemeProvider>();

// Switch themes
themeProvider.toggleTheme();           // Toggle light/dark
themeProvider.setLightMode();          // Force light mode
themeProvider.setDarkMode();           // Force dark mode
themeProvider.setSystemMode();         // Follow system preference
```

## Available Theme Components

### Light Theme

- **Surface**: White background
- **Primary**: Green brand color
- **Secondary**: Light green accent
- **Tertiary**: Blue accent
- **Error**: Red for errors
- **Outline**: Light gray borders

### Dark Theme

- **Surface**: Dark gray background
- **Primary**: Same green brand color
- **Secondary**: Light green accent
- **Tertiary**: Blue accent
- **Error**: Red for errors
- **Outline**: Dark gray borders

## Material 3 Design Tokens

### Colors

- `primary` / `onPrimary`
- `secondary` / `onSecondary`
- `tertiary` / `onTertiary`
- `error` / `onError`
- `surface` / `onSurface`
- `outline` / `outlineVariant`

### Elevation

- Cards: `elevation: 0` with subtle borders
- Buttons: `elevation: 0` with modern styling
- Surfaces: Flat design with proper contrast

### Typography

- Consistent font weights and sizes
- Proper contrast ratios
- Responsive text scaling

### Spacing

- Consistent 12px border radius
- Proper padding and margins
- Responsive spacing with ScreenUtil

## Benefits

1. **Consistency** - Unified design across all screens
2. **Accessibility** - Proper contrast and touch targets
3. **Modern UI** - Latest Material Design principles
4. **Dark Mode** - Complete dark theme support
5. **Maintainability** - Centralized theme configuration
6. **Performance** - Optimized color schemes and components

## Migration Notes

- All existing screens automatically inherit Material 3 styling
- No code changes required for basic Material 3 adoption
- Custom styling can be overridden where needed
- Theme provider available for dynamic theme switching
