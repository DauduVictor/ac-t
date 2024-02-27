import 'package:acm_test/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_state.dart';
part 'categories_cubit.freezed.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({
    ProductRepository? productRepository,
  })  : _productRepository = productRepository ?? ProductRepository(),
        super(const CategoriesState.initial());

  final ProductRepository _productRepository;

  /// Function to get all categories
  Future<void> getAllCategories() async {
    try {
      emit(const _Loading());
      final response = await _productRepository.getAllCategories();
      emit(_Loaded(categories: response));
    } on ProductException catch (e) {
      emit(_Error(error: e));
    }
  }
}
