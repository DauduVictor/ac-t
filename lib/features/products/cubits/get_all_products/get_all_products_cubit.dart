import 'package:acm_test/core/repository/models/models.dart';
import 'package:acm_test/core/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_products_state.dart';
part 'get_all_products_cubit.freezed.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit({
    ProductRepository? productRepository,
  })  : _productRepository = productRepository ?? ProductRepository(),
        super(const GetAllProductsState.initial());

  final ProductRepository _productRepository;

  ///Function to get all products
  Future<void> getAllProduct({String? category}) async {
    try {
      emit(const _Initial());
      emit(const _Loading());
      final getAllProductApiResponse =
          await _productRepository.getAllProducts(category: category);
      emit(_GottenAllProducts(
        allProductResponse: getAllProductApiResponse,
      ));
    } on XException catch (e) {
      emit(_Error(error: e));
    }
  }
}
