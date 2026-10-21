class ErrorInterceptor {
  static String handleError(int? statusCode, String? responseBody) {
    switch (statusCode) {
      case 400:
        return 'Bad request.';
      case 401:
        return 'Unauthorized access.';
      case 403:
        return 'Access forbidden.';
      case 404:
        return 'Resource not found.';
      case 500:
        return 'Internal server error.';
      default:
        return responseBody ?? 'Something went wrong.';
    }
  }
}
