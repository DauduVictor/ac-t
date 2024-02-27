import 'package:acm_test/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_state.dart';
part 'products_cubit.freezed.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({
    ProductRepository? productRepository,
  })  : _productRepository = productRepository ?? ProductRepository(),
        super(const ProductsState.initial());

  final ProductRepository _productRepository;

  /// Function to get all products
  Future<void> getAllProduct({String? category}) async {
    try {
      emit(const _Loading());
      final response =
          await _productRepository.getAllProducts(category: category);
      emit(_Loaded(products: response));
    } on ProductException catch (e) {
      emit(_Error(error: e));
    }
  }
}
