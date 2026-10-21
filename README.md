<![CDATA[# 🚀 CareerCraft

**Your all-in-one career development companion — built with Flutter.**

CareerCraft empowers job seekers, students, and professionals to take control of their career journey. From building polished resumes to discovering opportunities and preparing for interviews, CareerCraft puts everything you need in one beautifully designed app.

---

## ✨ Features (Planned)

| Module | Description |
|---|---|
| 📄 **Resume Builder** | Create professional, ATS-friendly resumes with customizable templates |
| 🔍 **Job Discovery** | Browse and filter job listings from multiple sources |
| 🧭 **Career Path Planner** | Explore career roadmaps and skill-gap analysis |
| 🎯 **Skill Assessment** | Take quizzes and assessments to benchmark your skills |
| 🎤 **Interview Prep** | Practice with mock interview questions and tips |
| 👤 **Profile Dashboard** | Track applications, saved jobs, and career progress |
| 🔔 **Smart Notifications** | Get alerts for new job matches and application updates |

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| **Frontend** | [Flutter](https://flutter.dev) (Dart) |
| **Backend** | [Laravel](https://laravel.com) (PHP) — *coming later* |
| **State Management** | TBD (Provider / Riverpod / Bloc) |
| **Local Storage** | TBD (Hive / SharedPreferences / Drift) |
| **Min SDK** | Dart SDK `^3.13.5` |

> **Current Phase:** Frontend development only. The Laravel API backend will be integrated in a future phase.

---

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable channel)
- Dart SDK `^3.13.5`
- Android Studio / VS Code with Flutter extensions
- An emulator or physical device

### Installation

```bash
# Clone the repository
git clone https://github.com/<your-username>/career_craft.git

# Navigate to the project directory
cd career_craft

# Install dependencies
flutter pub get

# Run the app
flutter run
```

---

## 🏗️ Project Structure

```
career_craft/
│
├── lib/
│   ├── main.dart                          # App entry point
│   │
│   ├── app/                               # App-level configuration
│   │   ├── theme/                         # Colors, typography, app theme data
│   │   └── routes/                        # Named routes & route generator
│   │
│   ├── config/                            # Environment configs, API base URLs
│   │
│   ├── core/                              # Shared / cross-feature code
│   │   ├── constants/                     # App-wide constant values
│   │   ├── utils/                         # Helper functions & formatters
│   │   ├── extensions/                    # Dart extension methods
│   │   ├── enums/                         # Shared enumerations
│   │   ├── errors/                        # Custom exception & failure classes
│   │   ├── network/                       # API client, interceptors (future)
│   │   └── widgets/                       # Reusable UI components (buttons, cards, etc.)
│   │
│   └── features/                          # Feature modules (one folder per feature)
│       │
│       ├── auth/                          # 🔐 Authentication
│       │   ├── screens/                   #    Login, Register, Forgot Password
│       │   └── widgets/                   #    Auth-specific reusable widgets
│       │
│       ├── onboarding/                    # 👋 Onboarding / Welcome
│       │   ├── screens/                   #    Welcome slides, intro screens
│       │   └── widgets/                   #    Page indicators, onboarding cards
│       │
│       ├── home/                          # 🏠 Home / Dashboard
│       │   ├── screens/                   #    Main dashboard screen
│       │   └── widgets/                   #    Stat cards, quick-action tiles
│       │
│       ├── resume_builder/                # 📄 Resume Builder
│       │   ├── screens/                   #    Template picker, editor, preview
│       │   ├── widgets/                   #    Section editors, template cards
│       │   └── models/                    #    Resume, Education, Experience models
│       │
│       ├── job_discovery/                 # 🔍 Job Discovery
│       │   ├── screens/                   #    Job list, job detail, filters
│       │   ├── widgets/                   #    Job cards, filter chips
│       │   └── models/                    #    Job, Company, Location models
│       │
│       ├── career_path/                   # 🧭 Career Path Planner
│       │   ├── screens/                   #    Roadmap view, skill-gap analysis
│       │   ├── widgets/                   #    Milestone nodes, progress bars
│       │   └── models/                    #    CareerPath, Milestone models
│       │
│       ├── skill_assessment/              # 🎯 Skill Assessment
│       │   ├── screens/                   #    Quiz screen, results screen
│       │   ├── widgets/                   #    Question cards, score indicators
│       │   └── models/                    #    Quiz, Question, Result models
│       │
│       ├── interview_prep/                # 🎤 Interview Prep
│       │   ├── screens/                   #    Question bank, mock interview
│       │   ├── widgets/                   #    Flashcards, tip banners
│       │   └── models/                    #    InterviewQuestion, Category models
│       │
│       ├── profile/                       # 👤 User Profile
│       │   ├── screens/                   #    Profile view, edit profile
│       │   ├── widgets/                   #    Avatar, stats summary
│       │   └── models/                    #    User, ProfileStats models
│       │
│       ├── notifications/                 # 🔔 Notifications
│       │   ├── screens/                   #    Notification list
│       │   └── widgets/                   #    Notification tiles
│       │
│       └── settings/                      # ⚙️ Settings
│           ├── screens/                   #    App settings, theme toggle
│           └── widgets/                   #    Setting tiles, switches
│
├── assets/                                # Static assets
│   ├── images/                            #    Illustrations, backgrounds
│   ├── icons/                             #    Custom SVG / PNG icons
│   ├── fonts/                             #    Custom typefaces
│   └── animations/                        #    Lottie / Rive animations
│
├── test/                                  # Unit & widget tests
├── pubspec.yaml                           # Dependencies & project config
└── README.md
```

---

## 🎨 Design Philosophy

- **Clean & Modern UI** — Material Design 3 with a cohesive color system
- **User-First Experience** — Intuitive navigation and minimal friction
- **Responsive Layouts** — Adaptive design for phones, tablets, and desktop
- **Accessibility** — Support for screen readers, dynamic font sizes, and high-contrast themes

---

## 🗺️ Roadmap

### Phase 1 — Frontend (Current)
- [x] Project setup & folder structure
- [ ] App theming & design system
- [ ] Onboarding screens
- [ ] Authentication UI (Login / Register)
- [ ] Home dashboard
- [ ] Resume Builder UI
- [ ] Job Discovery UI
- [ ] Profile & Settings screens
- [ ] Dark mode support

### Phase 2 — Backend Integration
- [ ] Laravel API setup
- [ ] User authentication (Sanctum / Passport)
- [ ] REST API integration in Flutter
- [ ] Resume data persistence
- [ ] Job listing API & search
- [ ] Push notifications

### Phase 3 — Advanced Features
- [ ] Career Path Planner
- [ ] Skill Assessment engine
- [ ] Interview Prep module
- [ ] Localization (multi-language)
- [ ] Analytics & reporting

---

## 🤝 Contributing

Contributions are welcome! If you'd like to contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 📬 Contact

Have questions or suggestions? Feel free to open an [issue](https://github.com/<your-username>/career_craft/issues) or reach out!

---

<p align="center">
  Built with ❤️ using <a href="https://flutter.dev">Flutter</a> + <a href="https://laravel.com">Laravel</a>
</p>
]]>
