class AppGenericException implements Exception {
  AppGenericException({required this.message});

  final String message;
}

class AppNetworkException implements Exception {
  AppNetworkException({required this.message});

  final String message;
}
