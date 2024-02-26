// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_category_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllCategoryResponse _$AllCategoryResponseFromJson(Map<String, dynamic> json) {
  return _AllCategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$AllCategoryResponse {
  List<String> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllCategoryResponseCopyWith<AllCategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllCategoryResponseCopyWith<$Res> {
  factory $AllCategoryResponseCopyWith(
          AllCategoryResponse value, $Res Function(AllCategoryResponse) then) =
      _$AllCategoryResponseCopyWithImpl<$Res, AllCategoryResponse>;
  @useResult
  $Res call({List<String> data});
}

/// @nodoc
class _$AllCategoryResponseCopyWithImpl<$Res, $Val extends AllCategoryResponse>
    implements $AllCategoryResponseCopyWith<$Res> {
  _$AllCategoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllCategoryResponseImplCopyWith<$Res>
    implements $AllCategoryResponseCopyWith<$Res> {
  factory _$$AllCategoryResponseImplCopyWith(_$AllCategoryResponseImpl value,
          $Res Function(_$AllCategoryResponseImpl) then) =
      __$$AllCategoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> data});
}

/// @nodoc
class __$$AllCategoryResponseImplCopyWithImpl<$Res>
    extends _$AllCategoryResponseCopyWithImpl<$Res, _$AllCategoryResponseImpl>
    implements _$$AllCategoryResponseImplCopyWith<$Res> {
  __$$AllCategoryResponseImplCopyWithImpl(_$AllCategoryResponseImpl _value,
      $Res Function(_$AllCategoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$AllCategoryResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllCategoryResponseImpl implements _AllCategoryResponse {
  const _$AllCategoryResponseImpl({required final List<String> data})
      : _data = data;

  factory _$AllCategoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllCategoryResponseImplFromJson(json);

  final List<String> _data;
  @override
  List<String> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'AllCategoryResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllCategoryResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllCategoryResponseImplCopyWith<_$AllCategoryResponseImpl> get copyWith =>
      __$$AllCategoryResponseImplCopyWithImpl<_$AllCategoryResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllCategoryResponseImplToJson(
      this,
    );
  }
}

abstract class _AllCategoryResponse implements AllCategoryResponse {
  const factory _AllCategoryResponse({required final List<String> data}) =
      _$AllCategoryResponseImpl;

  factory _AllCategoryResponse.fromJson(Map<String, dynamic> json) =
      _$AllCategoryResponseImpl.fromJson;

  @override
  List<String> get data;
  @override
  @JsonKey(ignore: true)
  _$$AllCategoryResponseImplCopyWith<_$AllCategoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
