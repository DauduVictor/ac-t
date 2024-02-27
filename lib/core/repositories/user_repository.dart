import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:acm_test/core/core.dart';
import 'package:acm_test/ui/utils/utils.dart';

// User exception errros
class UserException implements Exception {
  const UserException({String? message})
      : message = message ?? 'Something went wrong';

  /// Error message.
  final String? message;

  @override
  String toString() => message!;
}

class UserRepository {
  UserRepository({
    http.Client? client,
  }) : _client = client ?? http.Client();

  final http.Client _client;

  /// User login
  String _userLogin() => '${kBaseUrl}log_in';

  /// Login user
  ///
  /// Returns [SignInResponse] on success.
  /// Throws [UserException] when operation fails.

  Future<SignInResponse> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final url = _userLogin();
      final headers = {'content-type': 'application/json'};
      final body = jsonEncode({
        'email': email,
        'password': password,
      });
      return await APIHelper.request<SignInResponse>(
        request: _client.post(
          Uri.parse(url),
          headers: headers,
          body: body,
        ),
        onSuccessMap: SignInResponse.fromJson,
      );
    } on APIException catch (e) {
      throw UserException(message: e.message);
    }
  }
}
