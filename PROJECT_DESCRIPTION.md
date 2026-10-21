# 🚀 CareerCraft — Comprehensive Project Description

## 1. Executive Summary & Vision

**CareerCraft** is an all-in-one career development companion and modern recruitment platform built with **Flutter**. It empowers job seekers, students, and professionals to take full control of their professional growth — from initial career exploration and skill assessment to building polished, ATS-friendly resumes, practicing mock interviews, discovering verified job opportunities, and tracking applications in real time.

By uniting career preparation tools with a streamlined job discovery and application ecosystem, CareerCraft bridges the gap between ambitious talent and forward-thinking employers across mobile, web, and desktop platforms.

---

## 2. Problem Statement

### Challenges for Candidates & Job Seekers
- **Fragmented Tools**: Job seekers juggle multiple disconnected services — one for resume drafting, another for mock interviews, third-party sites for skill quizzes, and separate job boards for applications.
- **Application "Black Hole"**: Candidates submit resumes without feedback or transparency into whether their submission was viewed, shortlisted, or rejected.
- **Skill Gaps & Career Uncertainty**: Emerging professionals and career switchers often lack clear roadmaps and actionable feedback on the exact skills needed to qualify for desired roles.
- **Impersonal & Tedious Applications**: Lengthy, repetitive application forms create high friction and candidate drop-off.

### Challenges for Employers & Recruiters
- **Unscreened & Unprepared Candidates**: High volume of low-relevance applications increases screening fatigue and slows hiring turnaround.
- **Inefficient Pipeline Management**: Manual tracking across emails and spreadsheets leads to lost talent and inconsistent communication.
- **Costly & Complex HR Systems**: Smaller and medium-sized organizations struggle with bloated enterprise HR systems that are difficult to configure and maintain.

---

## 3. The CareerCraft Solution

CareerCraft creates an end-to-end, unified career lifecycle platform:
1. **Prepare**: Benchmark abilities via interactive skill quizzes, study interview question banks, and simulate mock interviews.
2. **Build**: Craft tailored, ATS-compliant resumes with modern templates and instant previews.
3. **Plan**: Chart career roadmaps and pinpoint skill gaps to step up to the next seniority level.
4. **Discover & Apply**: Search verified job listings with transparent salaries, apply in seconds with attached resumes, and track application statuses seamlessly.
5. **Connect**: Enable transparent status updates (*Pending*, *Shortlisted*, *Accepted*, *Rejected*) between hiring teams and candidates.

---

## 4. Target Audience & Personas

| Persona | Description & Needs |
|---|---|
| **Students & Recent Graduates** | Seeking entry-level roles, internship guidance, resume templates, and structured interview preparation. |
| **Active Job Seekers & Professionals** | Looking for mid-to-senior positions, salary transparency, quick 1-click applications, and real-time status tracking. |
| **Career Changers & Upskillers** | Needing career roadmaps, skill-gap analysis, and targeted assessments to pivot into new industries. |
| **Employers & Hiring Teams** | Startups, growing companies, and HR teams wanting a modern, accessible portal to post vacancies, screen qualified candidates, and manage hiring pipelines. |

---

## 5. Core Features & Module Breakdown

As outlined in the project architecture and `README.md`, CareerCraft is structured into modular, feature-first components:

### 📄 1. Resume Builder (`resume_builder`)
- **Customizable Templates**: Choose from clean, professional, ATS-friendly resume templates (`template_picker_screen`).
- **Intuitive Section Editors**: Structured form fields for contact info, work history, education, certifications, skills, and projects (`resume_editor_screen`).
- **Live Preview & Management**: Real-time rendering of resume formatting, multi-resume management, and export-ready outputs (`resume_preview_screen`, `resume_list_screen`).

### 🔍 2. Job Discovery & Application (`job_discovery`)
- **Smart Search & Filters**: Search jobs by role, keywords, company, and location. Filter by employment type (Full-time, Part-time, Remote, Contract), experience level, and salary range (`job_filter_screen`, `job_list_screen`).
- **Comprehensive Job Details**: Clear view of job overview, responsibilities, required qualifications, benefits, compensation, and application deadlines (`job_detail_screen`).
- **Fast 1-Click Application**: Apply instantly by selecting a saved resume, indicating salary expectations, and attaching a cover letter.
- **Saved Opportunities**: Bookmark favorite listings for quick access.

### 🧭 3. Career Path Planner (`career_path`)
- **Role Roadmaps**: Visual milestone guides illustrating step-by-step career progressions (e.g., Junior Developer → Senior Engineer → Lead Architect) (`career_path_screen`).
- **Skill-Gap Analysis**: Identify missing proficiencies required for target positions and receive recommended steps to bridge those gaps (`skill_gap_screen`).

### 🎯 4. Skill Assessment (`skill_assessment`)
- **Curated Quizzes**: Test technical and domain knowledge across programming languages, design, management, and industry topics (`assessment_list_screen`).
- **Timed Quiz Experience**: Interactive multiple-choice assessments with immediate response validation (`quiz_screen`).
- **Performance Benchmarks**: Detailed scorecards highlighting strengths, areas for improvement, and skill badges for candidate profiles (`result_screen`).

### 🎤 5. Interview Prep (`interview_prep`)
- **Question Bank**: Categorized library of commonly asked technical, behavioral, and situational interview questions with expert tips (`question_bank_screen`).
- **Mock Interview Simulator**: Practice answering realistic interview prompts under simulated interview conditions (`mock_interview_screen`).
- **Study Guides & Tips**: Practical frameworks (e.g., STAR method) and flashcards to boost candidate interview confidence (`interview_prep_screen`).

### 👤 6. Profile & Dashboard (`profile`, `home`)
- **Home Dashboard**: Quick glance at application statuses, recommended jobs, resume completeness, and ongoing career goals (`home_screen`).
- **Digital Candidate Profile**: Showcase biography, verified skills, portfolio links, and education history (`profile_screen`).
- **Application Tracker**: Monitor real-time status progressions across all submitted applications:
  - ⏳ **Pending**: Application received and awaiting employer review.
  - ⭐ **Shortlisted**: Profile under active review for interview scheduling.
  - 🎉 **Accepted**: Selected for interview or formal job offer.
  - ❌ **Rejected**: Transparent, respectful closure.

### 🔔 7. Smart Notifications (`notifications`)
- Timely push and in-app alerts for application status updates, new job postings matching user preferences, skill test reminders, and career tips.

### ⚙️ 8. Settings & Personalization (`settings`)
- Light and Dark theme switching, notification preferences, account credentials, and privacy configurations.

---

## 6. End-to-End User Journeys

### The Candidate Career Journey
```text
1. Discover & Assess       Take skill quizzes and benchmark proficiencies.
       ↓
2. Build & Prepare         Create ATS resumes and practice mock interview questions.
       ↓
3. Explore Opportunities   Filter verified job vacancies matching skills and preferences.
       ↓
4. Apply & Track           Submit 1-click applications and track live status updates.
       ↓
5. Grow & Advance          Follow career path roadmaps to achieve next-level milestones.
```

### The Employer Hiring Journey
```text
1. Onboard & Brand         Register company profile and showcase work culture.
       ↓
2. Publish Vacancy         Post detailed job descriptions, compensation, and deadlines.
       ↓
3. Review Pipeline         Evaluate candidate resumes, test scores, and cover letters.
       ↓
4. Shortlist & Hire        Update candidate statuses with a single click to streamline hiring.
```

---

## 7. Technology Stack & Multi-Platform Support

| Layer | Technology | Role / Purpose |
|---|---|---|
| **Frontend Framework** | [Flutter](https://flutter.dev) (Dart SDK `^3.13.5`) | Cross-platform UI codebase running on mobile, web, and desktop |
| **Backend API** | [Laravel](https://laravel.com) (PHP) | RESTful API, business logic, and database management *(phased rollout)* |
| **Authentication** | Laravel Sanctum / JWT | Secure token-based session and user authorization |
| **Architecture** | Feature-First Clean Architecture | Scalable folder structure separating core shared utilities from feature modules |
| **Design System** | Material Design 3 | Harmonious color palettes, fluid typography, dark mode, and responsive layouts |
| **HTTP Networking** | Dio / HTTP | Network client with interceptors for auth tokens and error handling |

### 📱 Supported Platforms
- ✅ **Android** (Phone & Tablet)
- ✅ **iOS** (iPhone & iPad)
- ✅ **Web** (Modern desktop and mobile browsers)
- ✅ **Windows** (Native desktop)
- ✅ **macOS** (Native desktop)
- ✅ **Linux** (Native desktop)

---

## 8. Development Roadmap

Aligned with the milestones defined in `README.md`:

### Phase 1 — Frontend Foundation (Current)
- [x] Project architecture and folder structure setup
- [x] Material Design 3 theme system (Light & Dark mode support)
- [x] Onboarding & Authentication UI (Login, Register, Forgot Password)
- [x] Home Dashboard with quick-access cards
- [x] Resume Builder UI (Template selector, editor, and preview)
- [x] Job Discovery & Filtering UI
- [x] Interview Prep (Question bank & Mock interview interface)
- [x] Career Path & Skill Gap UI
- [x] Skill Assessment & Quiz UI
- [x] Profile, Notifications, and Settings screens

### Phase 2 — Backend Integration
- [ ] Laravel API deployment & MySQL database schema configuration
- [ ] Sanctum token authentication & secure token storage
- [ ] Resume CRUD & cloud persistence
- [ ] Live Job listings API, search queries, and application submission endpoints
- [ ] Real-time application status tracking synchronization
- [ ] Push notification service integration

### Phase 3 — Advanced Capabilities
- [ ] Automated ATS resume scoring & keyword optimization suggestions
- [ ] AI-assisted mock interview feedback and question generation
- [ ] Multi-language internationalization (l10n)
- [ ] Employer recruiting dashboard & applicant pipeline manager
- [ ] Advanced career progression analytics and reporting
