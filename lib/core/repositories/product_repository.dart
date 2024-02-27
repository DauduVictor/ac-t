import 'package:acm_test/core/core.dart';
import 'package:http/http.dart' as http;
import 'package:acm_test/ui/utils/utils.dart';

// Product exception errros
class ProductException implements Exception {
  const ProductException({String? message})
      : message = message ?? 'Something went wrong';

  /// Error message.
  final String? message;

  @override
  String toString() => message!;
}

class ProductRepository {
  ProductRepository({
    http.Client? client,
  }) : _client = client ?? http.Client();

  final http.Client _client;

  /// Get all categories endpoint
  String _getAllCategories() => '${kBaseUrl}categories';

  /// Get all products endpoint
  String _getAllProducts() => '${kBaseUrl}products';

  /// Get All Categories
  ///
  /// Returns list of [String] on success.
  /// Throws [ProductException] when operation fails.

  Future<List<String>> getAllCategories() async {
    try {
      final url = _getAllCategories();
      final headers = {'content-type': 'application/json'};
      return await APIHelper.request<List<String>>(
        request: _client.get(
          Uri.parse(url),
          headers: headers,
        ),
        onSuccessList: (data) => data.map((e) => e.toString()).toList(),
      );
    } on APIException catch (e) {
      throw ProductException(message: e.message);
    }
  }

  /// Get All Products
  ///
  /// Returns list of [Product] on success.
  /// Throws [ProductException] when operation fails.
  Future<List<Product>> getAllProducts({
    String? category,
  }) async {
    try {
      var url = _getAllProducts().addQueryParams(queryParams: {
        if (category != null) 'category': category,
      });
      final headers = {'content-type': 'application/json'};

      return await APIHelper.request<List<Product>>(
        request: _client.get(
          Uri.parse(url),
          headers: headers,
        ),
        onSuccessList: (data) => data
            .map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    } on APIException catch (e) {
      throw ProductException(message: e.message);
    }
  }
}
