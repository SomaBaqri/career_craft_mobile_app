class ErrorHandler {
  static String getErrorMessage(dynamic error) {
    if (error is Exception) {
      return error.toString();
    }
    return 'An unexpected error occurred.';
  }
}
