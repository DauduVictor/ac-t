import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:acm_test/core/api_helper.dart';
import 'package:acm_test/ui/utils/utils.dart';
import 'models/models.dart';
import 'x_exception.dart';

class UserRepository {
  UserRepository({
    http.Client? client,
  }) : _client = client ?? http.Client();

  final http.Client _client;

  String _userLogin() => '${kBaseUrl}log_in';

  /// Login user
  ///
  /// Returns [HostFiLoginModel] on success.
  /// Throws [XException] when operation fails.

  Future<SignInResponse> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final url = _userLogin();
      final body = jsonEncode({
        'email': email,
        'password': password,
      });

      log(
        '''
          [APIHelper]:
            email: $email
            password: $password
            url: $url
          ''',
      );

      return await APIHelper.request<SignInResponse>(
        request: _client.post(
          Uri.parse(url),
          headers: {'content-type': 'application/json'},
          body: body,
        ),
        onSuccessMap: SignInResponse.fromJson,
      );
    } on APIException catch (e) {
      throw XException(message: e.message);
    }
  }
}
