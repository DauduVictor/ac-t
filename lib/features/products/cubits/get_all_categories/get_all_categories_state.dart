part of 'get_all_categories_cubit.dart';

@freezed
class GetAllCategoriesState with _$GetAllCategoriesState {
  const factory GetAllCategoriesState.initial() = _Initial;
  const factory GetAllCategoriesState.loading() = _Loading;
  const factory GetAllCategoriesState.gottenAllCategories({
    required AllCategoryResponse allCategoryResponse
  }) = _GottenAllCategories;
  const factory GetAllCategoriesState.error({
    required Exception error,
  }) = _Error;
}
