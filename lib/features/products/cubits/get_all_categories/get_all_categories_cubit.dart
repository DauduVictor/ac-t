import 'package:acm_test/core/repository/models/models.dart';
import 'package:acm_test/core/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_categories_state.dart';
part 'get_all_categories_cubit.freezed.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  GetAllCategoriesCubit({
    ProductRepository? productRepository,
  })  : _productRepository = productRepository ?? ProductRepository(),
        super(const GetAllCategoriesState.initial());

  final ProductRepository _productRepository;

  ///Function to get all categories
  Future<void> getAllCategories() async {
    try {
      emit(const _Loading());
      final allCategoryApiResponse =
          await _productRepository.getAllCategories();
      emit(
        _GottenAllCategories(allCategoryResponse: allCategoryApiResponse),
      );
    } on XException catch (e) {
      emit(_Error(error: e));
    }
  }
}
