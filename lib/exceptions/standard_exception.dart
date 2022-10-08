class StandardException implements Exception {
  final String code;
  final String message;

  StandardException({
    required this.code,
    required this.message,
  });

  @override
  String toString() {
    return "StandardException: $code - $message";
  }
}
