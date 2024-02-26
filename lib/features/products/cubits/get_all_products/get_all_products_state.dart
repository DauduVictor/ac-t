part of 'get_all_products_cubit.dart';

@freezed
class GetAllProductsState with _$GetAllProductsState {
  const factory GetAllProductsState.initial() = _Initial;
  const factory GetAllProductsState.loading() = _Loading;
  const factory GetAllProductsState.gottenAllProducts({
    required AllProductResponse allProductResponse
  }) = _GottenAllProducts;
  const factory GetAllProductsState.error({
    required Exception error,
  }) = _Error;
}
