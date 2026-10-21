# Professional Flutter App Architecture & Folder Structure

This architecture blueprint is tailored specifically for the **CareerCraft** mobile application. It follows the industry-standard **Feature-First Clean Architecture** approach, ensuring clear separation of concerns, scalability as new features are added, and high testability.

---

## 1. Directory Tree Overview

```text
career_craft/
├── android/
├── ios/
├── assets/
│   ├── icons/                   # Custom SVG / PNG icons
│   ├── images/                  # App illustrations, default company avatar, onboarding
│   └── fonts/                   # Local fonts (if not using GoogleFonts package)
│
├── test/                        # Unit, widget, and integration tests
│   ├── core/
│   └── features/
│
└── lib/
    ├── main.dart                # Application entrypoint & dependency initialization
    ├── app.dart                 # Root MaterialApp widget, global theme & router setup
    │
    ├── core/                    # App-wide shared infrastructure & utilities
    │   ├── constants/           # App constants (API endpoints, asset paths, storage keys)
    │   ├── errors/              # Exceptions, failure classes, and error mappers
    │   ├── network/             # Dio HTTP client, interceptors, connectivity checker
    │   ├── storage/             # Secure storage & SharedPreferences wrappers
    │   ├── theme/               # Colors, typography, shapes, and ThemeData definitions
    │   ├── utils/               # Formatters (currency, date), validators, logger
    │   └── widgets/             # Reusable design-system components (buttons, badges, inputs)
    │
    ├── routes/                  # Navigation & Route management (GoRouter or Navigator 2.0)
    │   ├── app_router.dart      # Route configuration with auth guard redirects
    │   └── route_names.dart     # String constants for all app routes
    │
    └── features/                # Domain-specific functional modules (Feature-First)
        ├── splash/              # Startup splash & auth status determination
        ├── auth/                # Login, Register, OTP Verification, Forgot Password
        ├── jobs/                # Job browsing, search, filter, and job details
        ├── companies/           # Company profiles, directory, and active listings
        ├── applications/        # Job seeker's applied jobs, status tracking, withdrawing
        ├── profile/             # Candidate CV builder, skills, experience, account settings
        └── employer/            # Employer dashboard, job management, candidate pipeline
```

---

## 2. In-Depth Layer Breakdown

### 📁 `lib/core/` (Foundational Layer)

The `core` folder contains code that is independent of any specific business feature:

```text
lib/core/
├── constants/
│   ├── api_endpoints.dart       # All backend URL paths (/login, /jobs, etc.)
│   ├── app_constants.dart       # App version, pagination limits (e.g. 20 items)
│   └── storage_keys.dart        # Keys for auth token, user role, onboard status
│
├── errors/
│   ├── exceptions.dart          # ServerException, CacheException, NetworkException
│   ├── failures.dart            # Failure models consumed by UI/State layer
│   └── error_handler.dart       # Converts Dio error responses into user-friendly strings
│
├── network/
│   ├── api_client.dart          # Dio instance singleton with timeout and base configs
│   ├── auth_interceptor.dart    # Injects 'Authorization: Bearer <token>'
│   └── error_interceptor.dart   # Global interceptor for 401 unauthenticated & 500 errors
│
├── storage/
│   └── secure_storage_service.dart # Read/write/delete auth tokens securely
│
├── theme/
│   ├── app_colors.dart          # Navy, Emerald, Slate palette
│   ├── app_text_styles.dart     # Inter font typography scale
│   └── app_theme.dart           # ThemeData (cards, inputs, buttons, appbar)
│
├── utils/
│   ├── date_formatter.dart      # Formats dates (e.g., "Posted 2 days ago")
│   ├── currency_formatter.dart  # Formats salaries (e.g., "$75,000 / yr")
│   └── validators.dart          # Email regex, password length, required fields
│
└── widgets/
    ├── brand_logo.dart          # CareerCraft emerald badge logo
    ├── custom_button.dart       # Primary Emerald & Outlined Navy buttons
    ├── custom_text_field.dart   # Styled form inputs with prefix icons & error text
    ├── status_badge.dart        # Pills for "Pending", "Shortlisted", "Active"
    ├── empty_state_view.dart    # "No jobs found" placeholder illustration
    ├── loading_indicator.dart   # Consistent emerald circular loader
    └── error_view.dart          # Network retry container
```

---

### 📁 `lib/features/` (Modular Business Logic)

Each feature is organized using a Clean 3-Tier Layer:
1. **`data/`**: Models, remote data sources (API calls), local caches, and repository implementations.
2. **`domain/`**: Pure business rules, entity models, and use cases (optional depending on state management).
3. **`presentation/`**: UI screens, feature-specific widgets, and state management controllers (Bloc / Riverpod / Provider).

#### Feature 1: `features/auth/`
Handles user identity, role selection, and session lifecycle.
```text
features/auth/
├── data/
│   ├── datasources/
│   │   └── auth_remote_datasource.dart # Dio calls to /register, /login, /verify-otp
│   ├── models/
│   │   ├── auth_response_model.dart
│   │   └── user_model.dart
│   └── repositories/
│       └── auth_repository_impl.dart
├── presentation/
│   ├── controllers/                    # AuthBloc / AuthNotifier / AuthProvider
│   │   ├── auth_state.dart
│   │   └── auth_controller.dart
│   ├── screens/
│   │   ├── login_screen.dart
│   │   ├── register_screen.dart
│   │   ├── otp_verification_screen.dart
│   │   └── role_selection_screen.dart
│   └── widgets/
│       ├── auth_header.dart
│       └── role_selector_card.dart
```

#### Feature 2: `features/jobs/`
Public and authenticated job discovery, filters, search, and job details.
```text
features/jobs/
├── data/
│   ├── datasources/
│   │   └── job_remote_datasource.dart  # GET /jobs, GET /jobs/{id}
│   ├── models/
│   │   ├── job_model.dart
│   │   └── paginated_jobs_response.dart
│   └── repositories/
│       └── job_repository_impl.dart
├── presentation/
│   ├── controllers/
│   │   └── job_list_controller.dart
│   ├── screens/
│   │   ├── job_feed_screen.dart        # Search bar, category chips, job list
│   │   ├── job_details_screen.dart     # Full description, company info, "Apply" CTA
│   │   └── job_filter_modal.dart       # Bottom sheet with Job Type, Category filters
│   └── widgets/
│       ├── job_card.dart               # Mirrored Web Card with salary & badges
│       ├── category_chip.dart
│       └── search_bar_widget.dart
```

#### Feature 3: `features/applications/`
Candidate application workflow and tracking.
```text
features/applications/
├── data/
│   ├── datasources/
│   │   └── application_remote_datasource.dart # POST /jobs/{id}/apply, GET /my-applications
│   ├── models/
│   │   └── application_model.dart
│   └── repositories/
│       └── application_repository_impl.dart
├── presentation/
│   ├── controllers/
│   │   └── application_controller.dart
│   ├── screens/
│   │   ├── apply_job_bottom_sheet.dart # Resume picker, cover letter input
│   │   └── my_applications_screen.dart # List of submitted applications with status pills
│   └── widgets/
│       ├── application_card.dart
│       └── application_status_tag.dart
```

#### Feature 4: `features/employer/`
Employer-specific dashboard, vacancy posting, and applicant pipeline.
```text
features/employer/
├── data/
│   ├── datasources/
│   │   └── employer_remote_datasource.dart # /employer/dashboard, /employer/jobs, etc.
│   ├── models/
│   │   └── employer_dashboard_stats.dart
│   └── repositories/
│       └── employer_repository_impl.dart
├── presentation/
│   ├── controllers/
│   │   ├── employer_dashboard_controller.dart
│   │   └── post_job_controller.dart
│   ├── screens/
│   │   ├── employer_dashboard_screen.dart # Stat metric cards, quick actions
│   │   ├── manage_vacancies_screen.dart   # Toggle status (active/closed), edit, delete
│   │   ├── post_job_screen.dart           # Job creation form
│   │   └── candidate_pipeline_screen.dart # Review candidates & update status
│   └── widgets/
│       ├── stat_metric_card.dart
│       ├── applicant_review_card.dart
│       └── status_action_bottom_sheet.dart
```

#### Feature 5: `features/companies/`
Browsing verified hiring companies.
```text
features/companies/
├── data/
│   ├── datasources/
│   │   └── company_remote_datasource.dart # GET /companies, GET /companies/{id}
│   └── models/
│       └── company_model.dart
└── presentation/
    ├── screens/
    │   ├── company_list_screen.dart
    │   └── company_details_screen.dart
    └── widgets/
        └── company_card.dart
```

#### Feature 6: `features/profile/`
Candidate profile, CV preview, and account settings.
```text
features/profile/
├── data/
│   ├── datasources/
│   │   └── profile_remote_datasource.dart # GET /profile, PUT /profile
│   └── models/
│       └── profile_model.dart
└── presentation/
    ├── screens/
    │   ├── profile_screen.dart
    │   ├── edit_profile_screen.dart
    │   └── resume_preview_screen.dart
    └── widgets/
        ├── skill_chip_input.dart
        └── profile_avatar.dart
```

---

## 3. Navigation & Main Entrypoint Blueprint

### `lib/routes/app_router.dart`
Using **GoRouter** for URL-like navigation and deep-linking:

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Screens
import '../features/splash/screens/splash_screen.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/register_screen.dart';
import '../features/jobs/screens/job_feed_screen.dart';
import '../features/jobs/screens/job_details_screen.dart';
import '../features/applications/screens/my_applications_screen.dart';
import '../features/employer/screens/employer_dashboard_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/jobs',
        builder: (context, state) => const JobFeedScreen(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (context, state) => JobDetailsScreen(
              jobId: state.pathParameters['id']!,
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/my-applications',
        builder: (context, state) => const MyApplicationsScreen(),
      ),
      GoRoute(
        path: '/employer/dashboard',
        builder: (context, state) => const EmployerDashboardScreen(),
      ),
    ],
  );
}
```

### `lib/main.dart`
Clean app bootstrapper:
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/theme/app_theme.dart';
import 'routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Lock orientation or initialize dependencies here
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const CareerCraftApp());
}

class CareerCraftApp extends StatelessWidget {
  const CareerCraftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CareerCraft',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}
```

---

## 4. Best Practices & Rules

1. **Keep `core/` feature-agnostic**:
   - Never import from `features/` inside `core/`.
   - `core/` can only depend on third-party packages (Dio, GoogleFonts, etc.) or other `core/` utilities.

2. **Feature Isolation**:
   - Code inside `features/jobs/` should not directly modify internal state in `features/employer/`.
   - Communication between features occurs via shared models in `core/` or global state.

3. **Data Immutability**:
   - Make all model classes immutable using `final` fields.
   - Use `fromJson` / `toJson` pattern for clean serialization with the Laravel backend.

4. **Error Handling**:
   - Always catch `DioException` in the data source/repository and map to a standard `Failure` object.
   - UI screens should only react to state (e.g. `LoadingState`, `SuccessState<T>`, `ErrorState(message)`), keeping logic out of `build()` methods.
