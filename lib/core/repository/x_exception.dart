// A class for all exception errros
class XException implements Exception {
  const XException({String? message})
      : message = message ?? 'Something went wrong';

  /// Error message.
  final String? message;

  @override
  String toString() => message!;
}