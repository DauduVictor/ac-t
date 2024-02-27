import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

/// {@template api_exception}
/// General exception for [APIHelper] methods.
/// {@endtemplate}
class APIException implements Exception {
  /// {@macro api_exception}
  const APIException({String? message})
      : message = message ?? 'Something went wrong';

  /// Error message.
  final String message;

  @override
  String toString() => message;
}

class APIHelper {
  static Future<T> request<T>({
    required Future<http.Response> request,
    T Function(Map<String, dynamic> data)? onSuccessMap,
    T Function(List<dynamic> data)? onSuccessList,
  }) async {
    assert(
      (onSuccessMap != null && onSuccessList == null) ||
          (onSuccessMap == null && onSuccessList != null),
      '`onSuccessMap` OR `onSuccessList` must be defined.',
    );
    try {
      final response = await request;
      log(':::api response status code: ${response.statusCode}');
      log(':::api response: ${response.body}');

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        if (onSuccessMap != null) {
          final utf8Response = utf8.decode(response.bodyBytes);
          final map = jsonDecode(utf8Response) as Map<String, dynamic>;
          if (map['data'] == null) {
            return onSuccessMap(<String, dynamic>{});
          }
          final data = map['data'] as Map<String, dynamic>;
          return onSuccessMap(data);
        } else if (onSuccessList != null) {
          final utf8Response = utf8.decode(response.bodyBytes);
          final map = jsonDecode(utf8Response) as Map<String, dynamic>;
          if (map['data'] == null) {
            return onSuccessList([]);
          }
          final list = (map['data'] as List);
          return onSuccessList(list);
        }
      }

      // Check if error message exists and if it is an array, pick the first elemet.
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      if (data['code'] != 'Success') {
        if (data.containsKey('errors') && (data['errors'] as List).isNotEmpty) {
          log(
            '''
            [APIHelper]: 
              method: ${response.request?.method}
              url: ${response.request?.url}
              headers: ${response.request?.headers}
              statusCode: ${response.statusCode}
              message: ${data['errors'][0]['message']}
              body: ${response.body}
            ''',
          );
          throw APIException(message: data['errors'][0]['message'] as String);
        } else {
          log(
            '''
            [APIHelper]: 
              method: ${response.request?.method}
              url: ${response.request?.url}
              headers: ${response.request?.headers}
              statusCode: ${response.statusCode}
              message: ${data['message']}
              body: ${response.body}
            ''',
          );
          throw APIException(message: data['message'] as String);
        }
      }

      log('[APIHelper](request)(body): ${response.body}');
      throw const APIException();
    } catch (e) {
      if (e is SocketException) {
        throw const APIException(message: 'No internet connection');
      }
      if (e is HandshakeException) {
        throw const APIException(message: 'Error occurred, try again');
      }
      if (e is TimeoutException) {
        throw const APIException(message: 'Request timeout, try again!');
      }
      if (e is FormatException) {
        throw const APIException(message: 'Error occurred, try again!');
      }
      log('[APIHelper](request)(e): ${e.toString()}');
      throw APIException(message: e.toString());
    }
  }
}
