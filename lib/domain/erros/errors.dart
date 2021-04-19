abstract class Failure implements Exception {
  String get message;
}

class ConnectionError extends Failure {
  final String message;
  ConnectionError({required this.message});
}

class ErrorLogin extends Failure {
  final String message;
  ErrorLogin({required this.message});
}

class InternalError implements Failure {
  final String message;
  InternalError({required this.message});
}
