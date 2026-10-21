import 'package:flutter/material.dart';
import 'app_routes.dart';
import '../../features/onboarding/screens/splash_screen.dart';
import '../../features/onboarding/screens/onboarding_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/register_screen.dart';
import '../../features/auth/screens/forgot_password_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/resume_builder/screens/resume_list_screen.dart';
import '../../features/resume_builder/screens/resume_editor_screen.dart';
import '../../features/resume_builder/screens/resume_preview_screen.dart';
import '../../features/resume_builder/screens/template_picker_screen.dart';
import '../../features/job_discovery/screens/job_list_screen.dart';
import '../../features/job_discovery/screens/job_detail_screen.dart';
import '../../features/job_discovery/screens/job_filter_screen.dart';
import '../../features/career_path/screens/career_path_screen.dart';
import '../../features/career_path/screens/skill_gap_screen.dart';
import '../../features/skill_assessment/screens/assessment_list_screen.dart';
import '../../features/skill_assessment/screens/quiz_screen.dart';
import '../../features/skill_assessment/screens/result_screen.dart';
import '../../features/interview_prep/screens/interview_prep_screen.dart';
import '../../features/interview_prep/screens/question_bank_screen.dart';
import '../../features/interview_prep/screens/mock_interview_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/profile/screens/edit_profile_screen.dart';
import '../../features/notifications/screens/notifications_screen.dart';
import '../../features/settings/screens/settings_screen.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case AppRoutes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.resumeList:
        return MaterialPageRoute(builder: (_) => const ResumeListScreen());
      case AppRoutes.resumeEditor:
        return MaterialPageRoute(builder: (_) => const ResumeEditorScreen());
      case AppRoutes.resumePreview:
        return MaterialPageRoute(builder: (_) => const ResumePreviewScreen());
      case AppRoutes.templatePicker:
        return MaterialPageRoute(builder: (_) => const TemplatePickerScreen());
      case AppRoutes.jobList:
        return MaterialPageRoute(builder: (_) => const JobListScreen());
      case AppRoutes.jobDetail:
        return MaterialPageRoute(builder: (_) => const JobDetailScreen());
      case AppRoutes.jobFilter:
        return MaterialPageRoute(builder: (_) => const JobFilterScreen());
      case AppRoutes.careerPath:
        return MaterialPageRoute(builder: (_) => const CareerPathScreen());
      case AppRoutes.skillGap:
        return MaterialPageRoute(builder: (_) => const SkillGapScreen());
      case AppRoutes.assessmentList:
        return MaterialPageRoute(builder: (_) => const AssessmentListScreen());
      case AppRoutes.quiz:
        return MaterialPageRoute(builder: (_) => const QuizScreen());
      case AppRoutes.result:
        return MaterialPageRoute(builder: (_) => const ResultScreen());
      case AppRoutes.interviewPrep:
        return MaterialPageRoute(builder: (_) => const InterviewPrepScreen());
      case AppRoutes.questionBank:
        return MaterialPageRoute(builder: (_) => const QuestionBankScreen());
      case AppRoutes.mockInterview:
        return MaterialPageRoute(builder: (_) => const MockInterviewScreen());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case AppRoutes.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case AppRoutes.notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}
