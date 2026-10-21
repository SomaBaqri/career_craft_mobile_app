# CareerCraft Design System & Flutter Theme Guide

This guide details the complete design system, typography, color palette, component styles, and ready-to-use Flutter theme implementation to make your mobile app look and feel **identical** to the **CareerCraft** website.

---

## 1. Visual Identity & Brand Concept

The CareerCraft aesthetic is a **modern, high-trust SaaS interface** built on:
- **Deep Navy (`#1E293B`)**: Imparts authority, reliability, and corporate professionalism (Header/Navbars, Hero, Headings).
- **Vibrant Emerald (`#10B981`)**: Represents growth, opportunity, career milestones, and primary action items (CTAs, Badges, Highlights).
- **Clean Slate Background (`#F8FAFC`)**: A distraction-free light canvas that makes white cards stand out cleanly.
- **Inter Typography**: A neo-grotesque font family with crisp readability on mobile displays.

---

## 2. Color Palette & Hex Reference

| Name | Hex Code | Flutter Color | Usage on Website |
| :--- | :--- | :--- | :--- |
| **Brand Primary (Deep Navy)** | `#1E293B` | `Color(0xFF1E293B)` | Navbar, Hero background, Footers, Primary Headings |
| **Brand Primary Light** | `#334155` | `Color(0xFF334155)` | Secondary headers, Dark chip backgrounds |
| **Brand Dark (Hero Base)** | `#0F172A` | `Color(0xFF0F172A)` | Hero gradient stop, High-contrast text |
| **Brand Accent (Vibrant Emerald)** | `#10B981` | `Color(0xFF10B981)` | Primary buttons ("Get Started", "Post Job"), "Craft" in logo |
| **Brand Accent Dark (Hover)** | `#059669` | `Color(0xFF059669)` | Button pressed state, gradient accent |
| **Brand Background** | `#F8FAFC` | `Color(0xFFF8FAFC)` | Scaffold background, page canvas |
| **Brand Surface / Cards** | `#FFFFFF` | `Color(0xFFFFFFFF)` | Job cards, Modal dialogs, Bottom sheets |
| **Brand Border** | `#E2E8F0` | `Color(0xFFE2E8F0)` | 1px card borders, input borders, divider lines |
| **Brand Muted (Slate Gray)** | `#64748B` | `Color(0xFF64748B)` | Meta labels, subtitle text, icons |
| **Brand Text Primary** | `#0F172A` | `Color(0xFF0F172A)` | Body text, card titles, table headers |
| **Brand Text Secondary** | `#94A3B8` | `Color(0xFF94A3B8)` | Inactive icons, placeholder hints |
| **Accent Light (Emerald Tint)** | `#ECFDF5` | `Color(0xFFECFDF5)` | "Active" status badge, tag backgrounds |
| **Warning / Featured** | `#F59E0B` | `Color(0xFFF59E0B)` | "Featured" badge, urgent deadlines |
| **Danger / Expired** | `#EF4444` | `Color(0xFFEF4444)` | "Expired" badge, "Withdraw", "Delete" |

---

## 3. Typography (Google Fonts: Inter)

The web portal uses `Inter` across all headings and text blocks:

| Style | Weight | Web Size | Flutter Equivalent |
| :--- | :--- | :--- | :--- |
| **Hero Title / Display** | ExtraBold (800) | `32px - 40px` | `GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.w800, letterSpacing: -0.8)` |
| **Screen Titles (H1)** | Bold (700) | `24px - 28px` | `GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: -0.5)` |
| **Card / Job Title (H2)** | SemiBold (600) | `18px - 20px` | `GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600)` |
| **Section Header (H3)** | SemiBold (600) | `15px - 16px` | `GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)` |
| **Body Primary** | Regular (400) | `14px - 15px` | `GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400)` |
| **Subtitle / Meta** | Medium (500) | `12px - 13px` | `GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.muted)` |
| **Button Text** | SemiBold (600) | `14px` | `GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)` |
| **Badge / Chip** | SemiBold (600) | `11px - 12px` | `GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600)` |

---

## 4. UI Geometry, Radii & Shadows

- **Cards**:
  - Border Radius: `14px` (`BorderRadius.circular(14)`)
  - Border: `Border.all(color: AppColors.border, width: 1)`
  - Shadow:
    ```dart
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 10,
      offset: const Offset(0, 4),
    )
    ```
- **Buttons**:
  - Border Radius: `8px` (`BorderRadius.circular(8)`)
  - Padding: `EdgeInsets.symmetric(horizontal: 20, vertical: 12)`
  - Emerald Button Elevation Glow:
    ```dart
    BoxShadow(
      color: const Color(0xFF10B981).withOpacity(0.35),
      blurRadius: 12,
      offset: const Offset(0, 4),
    )
    ```
- **Text Form Fields**:
  - Border Radius: `10px`
  - Border: `BorderSide(color: Color(0xFFE2E8F0))`
  - Focused Border: `BorderSide(color: Color(0xFF10B981), width: 1.5)`
  - Fill Color: `#FFFFFF` or `#F8FAFC`
- **Badges / Status Chips**:
  - Pill Shape: `BorderRadius.circular(50)`
  - Padding: `EdgeInsets.symmetric(horizontal: 10, vertical: 4)`

---

## 5. Complete Flutter Theme Implementation

Add `google_fonts` to your `pubspec.yaml`:
```yaml
dependencies:
  google_fonts: ^6.2.1
```

### A. App Colors Definition (`lib/core/theme/app_colors.dart`)

```dart
import 'package:flutter/material.dart';

class AppColors {
  // Brand Core
  static const Color primary = Color(0xFF1E293B);       // Deep Navy
  static const Color primaryLight = Color(0xFF334155);  // Slate 700
  static const Color primaryDark = Color(0xFF0F172A);   // Slate 900
  static const Color accent = Color(0xFF10B981);        // Vibrant Emerald
  static const Color accentDark = Color(0xFF059669);    // Emerald 600

  // Backgrounds & Surfaces
  static const Color background = Color(0xFFF8FAFC);    // Page Canvas
  static const Color surface = Color(0xFFFFFFFF);       // Cards & Modals
  static const Color surfaceMuted = Color(0xFFF1F5F9);  // Subtle Input / Chip Fill

  // Text
  static const Color textPrimary = Color(0xFF0F172A);   // Headings, Titles
  static const Color textSecondary = Color(0xFF64748B); // Subtitles, Captions
  static const Color textLight = Color(0xFFFFFFFF);     // On Navy / Emerald
  static const Color textMuted = Color(0xFF94A3B8);     // Placeholders

  // Structural & Borders
  static const Color border = Color(0xFFE2E8F0);        // Card / Input Outlines
  static const Color divider = Color(0xFFE2E8F0);

  // Status & Badges
  static const Color successBg = Color(0xFFECFDF5);
  static const Color successText = Color(0xFF059669);

  static const Color warning = Color(0xFFF59E0B);
  static const Color warningBg = Color(0xFFFEF3C7);
  static const Color warningText = Color(0xFFD97706);

  static const Color danger = Color(0xFFEF4444);
  static const Color dangerBg = Color(0xFFFEE2E2);
  static const Color dangerText = Color(0xFFDC2626);

  static const Color infoBg = Color(0xFFEFF6FF);
  static const Color infoText = Color(0xFF2563EB);

  // Gradients
  static const LinearGradient brandGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
  );

  static const LinearGradient emeraldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF10B981), Color(0xFF059669)],
  );
}
```

---

### B. Global Theme Configuration (`lib/core/theme/app_theme.dart`)

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final baseTextTheme = GoogleFonts.interTextTheme();

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      
      // Color Scheme
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.textLight,
        secondary: AppColors.accent,
        onSecondary: AppColors.textLight,
        error: AppColors.danger,
        onError: AppColors.textLight,
        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,
      ),

      // App Bar Styling (Matches Deep Navy Web Navbar)
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textLight,
        elevation: 0,
        centerTitle: false,
        scrolledUnderElevation: 2,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.textLight,
          letterSpacing: -0.3,
        ),
        iconTheme: const IconThemeData(color: AppColors.textLight),
      ),

      // Card Theme (14px radius, 1px subtle border)
      cardTheme: CardTheme(
        color: AppColors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: AppColors.border, width: 1),
        ),
      ),

      // Elevated Buttons (Emerald Primary CTA)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.textLight,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Outlined Buttons (Navy border on white)
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          backgroundColor: AppColors.surface,
          side: const BorderSide(color: AppColors.border, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Form Text Input Fields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintStyle: GoogleFonts.inter(
          color: AppColors.textMuted,
          fontSize: 14,
        ),
        labelStyle: GoogleFonts.inter(
          color: AppColors.textSecondary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        prefixIconColor: AppColors.textSecondary,
        suffixIconColor: AppColors.textSecondary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.accent, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.danger),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 12,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
      ),

      // Text Theme
      textTheme: baseTextTheme.copyWith(
        displayLarge: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimary,
          letterSpacing: -0.8,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
          letterSpacing: -0.5,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textLight,
        ),
      ),
    );
  }
}
```

---

## 6. Pre-Built Flutter UI Components (Mirroring Web)

### 1. The CareerCraft Brand Header Logo
Matches `.navbar-brand` from web navbar:
```dart
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CareerCraftLogo extends StatelessWidget {
  final double fontSize;
  const CareerCraftLogo({super.key, this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Emerald Briefcase Icon Badge
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            gradient: AppColors.emeraldGradient,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.work_rounded,
            color: Colors.white,
            size: 18,
          ),
        ),
        const SizedBox(width: 8),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
            children: const [
              TextSpan(text: 'Career', style: TextStyle(color: Colors.white)),
              TextSpan(text: 'Craft', style: TextStyle(color: AppColors.accent)),
            ],
          ),
        ),
      ],
    );
  }
}
```

---

### 2. Website-Style Job Card Widget
Mirrors `.card-custom` used in `jobs/index.blade.php`:
```dart
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class WebJobCard extends StatelessWidget {
  final String title;
  final String companyName;
  final String location;
  final String jobType;
  final String? salary;
  final bool isFeatured;
  final VoidCallback onTap;

  const WebJobCard({
    super.key,
    required this.title,
    required this.companyName,
    required this.location,
    required this.jobType,
    this.salary,
    this.isFeatured = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: AppColors.border),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row: Company Icon & Titles & Featured
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Company Avatar Placeholder
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceMuted,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: const Icon(
                      Icons.business_rounded,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          companyName,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.warningBg,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.star_rounded, size: 14, color: AppColors.warningText),
                          SizedBox(width: 4),
                          Text(
                            'Featured',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: AppColors.warningText,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 14),

              // Chips: Location & Job Type
              Wrap(
                spacing: 8,
                runSpacing: 6,
                children: [
                  _Chip(icon: Icons.location_on_outlined, text: location),
                  _Chip(icon: Icons.schedule_outlined, text: jobType),
                  if (salary != null && salary!.isNotEmpty)
                    _Chip(
                      icon: Icons.payments_outlined,
                      text: salary!,
                      isHighlighted: true,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isHighlighted;

  const _Chip({
    required this.icon,
    required this.text,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isHighlighted ? AppColors.successBg : AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: isHighlighted ? AppColors.successText : AppColors.textSecondary,
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isHighlighted ? AppColors.successText : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
```

---

### 3. Metric / Stats Card Widget (For Employer & Dashboard)
Mirrors dashboard metrics from web:
```dart
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class StatMetricCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;

  const StatMetricCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.iconColor = AppColors.accent,
    this.iconBgColor = AppColors.successBg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

---

## 7. Activating the Theme in `main.dart`

To activate the CareerCraft theme in your Flutter app:

```dart
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const CareerCraftApp());
}

class CareerCraftApp extends StatelessWidget {
  const CareerCraftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CareerCraft',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(), // Your entry screen
    );
  }
}
```
