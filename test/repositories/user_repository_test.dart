import 'dart:convert';

import 'package:acm_test/core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class FakeUri extends Fake implements Uri {}

class MockClient extends Mock implements http.Client {}

void main() {
  late MockClient mockClient;
  late UserRepository userRepository;

  setUp(() {
    registerFallbackValue(FakeUri());

    mockClient = MockClient();
    userRepository = UserRepository(
      client: mockClient,
    );
  });

  const response = SignInResponse(
    error: false,
    message: 'message',
  );

  final tUserMapFromAPI = response.toJson();

  const tErrorMessage = 'error message';
  const tErrorMap = {'message': tErrorMessage};

  group('UserRepository', () {
    test('successfully creates UserRepository with default values', () {
      expect(
        UserRepository(),
        isA<UserRepository>(),
      );
    });

    group('loginUser', () {
      const email = 'user1@gmail.com';
      const password = '001122';

      final body = jsonEncode({
        'email': email,
        'password': password,
      });

      test('returns updated user', () async {
        final tResponse =
            http.Response(jsonEncode({'data': tUserMapFromAPI}), 200);
        when(
          () => mockClient.post(
            any(),
            headers: {'content-type': 'application/json'},
            body: body,
          ),
        ).thenAnswer((_) async => tResponse);

        final result = await userRepository.loginUser(
          email: email,
          password: password,
        );
        expect(result, response);
      });

      test(
          'throws a UserException '
          'when status code is not 200', () {
        final tResponse = http.Response(jsonEncode(<String, dynamic>{}), 403);
        when(
          () => mockClient.post(
            any(),
            headers: {'content-type': 'application/json'},
            body: body,
          ),
        ).thenAnswer((_) async => tResponse);
        expect(
          userRepository.loginUser(
            email: email,
            password: password,
          ),
          throwsA(isA<UserException>()),
        );
      });

      test('throws a UserException with error message', () async {
        final tResponse = http.Response(jsonEncode(tErrorMap), 403);
        when(
          () => mockClient.post(
            any(),
            headers: {'content-type': 'application/json'},
            body: body,
          ),
        ).thenAnswer((_) async => tResponse);

        expect(
          userRepository.loginUser(
            email: email,
            password: password,
          ),
          throwsA(isA<UserException>()),
        );
      });
    });
  });
}
