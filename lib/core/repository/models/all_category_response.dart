import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_category_response.freezed.dart';
part 'all_category_response.g.dart';

@freezed
class AllCategoryResponse with _$AllCategoryResponse {
  const factory AllCategoryResponse({
    required List<String> data,
  }) = _AllCategoryResponse;

  factory AllCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$AllCategoryResponseFromJson(json);
}
