part of 'categories_cubit.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial({
    @Default(<String>[]) List<String> categories,
  }) = _Initial;
  const factory CategoriesState.loading({
    @Default(<String>[]) List<String> categories,
  }) = _Loading;
  const factory CategoriesState.loaded({
    required List<String> categories,
  }) = _Loaded;
  const factory CategoriesState.error({
    @Default(<String>[]) List<String> categories,
    required Exception error,
  }) = _Error;
}
