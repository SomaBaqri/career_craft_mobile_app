class ApiEndpoints {
  ApiEndpoints._();

  // Auth
  static const String login = '/api/login';
  static const String register = '/api/register';
  static const String logout = '/api/logout';
  static const String forgotPassword = '/api/forgot-password';

  // Profile
  static const String profile = '/api/profile';
  static const String updateProfile = '/api/profile/update';

  // Resume
  static const String resumes = '/api/resumes';
  static const String resumeTemplates = '/api/resume-templates';

  // Jobs
  static const String jobs = '/api/jobs';
  static const String jobCategories = '/api/job-categories';

  // Career Path
  static const String careerPaths = '/api/career-paths';
  static const String skillGap = '/api/skill-gap';

  // Assessments
  static const String assessments = '/api/assessments';
  static const String quizzes = '/api/quizzes';

  // Interview
  static const String interviewQuestions = '/api/interview-questions';
  static const String mockInterviews = '/api/mock-interviews';
}
