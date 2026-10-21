import 'package:flutter/material.dart';
import 'route_names.dart';
import '../features/splash/screens/splash_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/jobs/presentation/screens/job_feed_screen.dart';
import '../features/applications/presentation/screens/my_applications_screen.dart';
import '../features/employer/presentation/screens/employer_dashboard_screen.dart';
import '../features/companies/presentation/screens/company_list_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteNames.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case RouteNames.jobs:
        return MaterialPageRoute(builder: (_) => const JobFeedScreen());
      case RouteNames.applications:
        return MaterialPageRoute(builder: (_) => const MyApplicationsScreen());
      case RouteNames.employerDashboard:
        return MaterialPageRoute(builder: (_) => const EmployerDashboardScreen());
      case RouteNames.companies:
        return MaterialPageRoute(builder: (_) => const CompanyListScreen());
      case RouteNames.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
