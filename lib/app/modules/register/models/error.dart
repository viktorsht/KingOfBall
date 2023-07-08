class RegisterUserException implements Exception {
  final Map<String, dynamic> errors;

  RegisterUserException(this.errors);

  @override
  String toString() {
    return '$errors';
  }
}
