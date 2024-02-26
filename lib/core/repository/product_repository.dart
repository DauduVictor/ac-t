import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:acm_test/core/api_helper.dart';
import 'package:acm_test/ui/utils/utils.dart';
import 'models/models.dart';
import 'x_exception.dart';

class ProductRepository {
  ProductRepository({
    http.Client? client,
  }) : _client = client ?? http.Client();

  final http.Client _client;

  String _getAllCategories() => '${kBaseUrl}categories';
  String _getAllProducts() => '${kBaseUrl}products';

  /// Get All Categories
  ///
  /// Returns [HostFiLoginModel] on success.
  /// Throws [XException] when operation fails.

  Future<AllCategoryResponse> getAllCategories() async {
    try {
      final url = _getAllCategories();

      log(
        '''
          [APIHelper]
            url: $url
          ''',
      );

      return await APIHelper.request<AllCategoryResponse>(
        request: _client.get(
          Uri.parse(url),
          headers: {'content-type': 'application/json'},
        ),
        onSuccessMap: AllCategoryResponse.fromJson,
      );
    } on APIException catch (e) {
      throw XException(message: e.message);
    }
  }

  /// Get All Products
  ///
  /// Returns [HostFiLoginModel] on success.
  /// Throws [XException] when operation fails.

  Future<AllProductResponse> getAllProducts({String? category}) async {
    try {
      String url = _getAllProducts();

      if (category != null) {
        url = '${_getAllProducts()}?category=$category';
      }

      log(
        '''
          [APIHelper]
            url: $url
            category: $category
          ''',
      );

      return await APIHelper.request<AllProductResponse>(
        request: _client.get(
          Uri.parse(url),
          headers: {'content-type': 'application/json'},
        ),
        onSuccessMap: AllProductResponse.fromJson,
      );
    } on APIException catch (e) {
      throw XException(message: e.message);
    }
  }
}
