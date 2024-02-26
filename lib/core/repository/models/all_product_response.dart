import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_product_response.freezed.dart';
part 'all_product_response.g.dart';

@freezed
class AllProductResponse with _$AllProductResponse {
  const factory AllProductResponse({
    required List<ProductDetails> data,
  }) = _AllProductResponse;

  factory AllProductResponse.fromJson(Map<String, dynamic> json) =>
      _$AllProductResponseFromJson(json);
}

@freezed
class ProductDetails with _$ProductDetails {
  const factory ProductDetails({
    @Default('') String name,
    @Default('') String image,
    @Default(0) int price,
    @Default(0) int quantity,
    @Default('') String category,
  }) = _Datum;

  factory ProductDetails.fromJson(Map<String, dynamic> json) => _$ProductDetailsFromJson(json);
}
