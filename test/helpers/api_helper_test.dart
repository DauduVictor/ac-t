import 'package:acm_test/core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockResponse extends Mock implements http.Response {}

void main() {
  group('APIHelper', () {
    group('request<T>', () {
      test(
          'throws assertion error when onSuccessMap and onSuccessList '
          'are both passed in', () {
        expect(
          APIHelper.request<void>(
            request: Future.value(MockResponse()),
            onSuccessMap: (_) {},
            onSuccessList: (_) {},
          ),
          throwsAssertionError,
        );
      });
    });
  });
}
