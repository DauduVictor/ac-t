// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_product_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllProductResponse _$AllProductResponseFromJson(Map<String, dynamic> json) {
  return _AllProductResponse.fromJson(json);
}

/// @nodoc
mixin _$AllProductResponse {
  List<ProductDetails> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllProductResponseCopyWith<AllProductResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllProductResponseCopyWith<$Res> {
  factory $AllProductResponseCopyWith(
          AllProductResponse value, $Res Function(AllProductResponse) then) =
      _$AllProductResponseCopyWithImpl<$Res, AllProductResponse>;
  @useResult
  $Res call({List<ProductDetails> data});
}

/// @nodoc
class _$AllProductResponseCopyWithImpl<$Res, $Val extends AllProductResponse>
    implements $AllProductResponseCopyWith<$Res> {
  _$AllProductResponseCopyWithImpl(this._value, this._then);

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
              as List<ProductDetails>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllProductResponseImplCopyWith<$Res>
    implements $AllProductResponseCopyWith<$Res> {
  factory _$$AllProductResponseImplCopyWith(_$AllProductResponseImpl value,
          $Res Function(_$AllProductResponseImpl) then) =
      __$$AllProductResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductDetails> data});
}

/// @nodoc
class __$$AllProductResponseImplCopyWithImpl<$Res>
    extends _$AllProductResponseCopyWithImpl<$Res, _$AllProductResponseImpl>
    implements _$$AllProductResponseImplCopyWith<$Res> {
  __$$AllProductResponseImplCopyWithImpl(_$AllProductResponseImpl _value,
      $Res Function(_$AllProductResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$AllProductResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ProductDetails>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllProductResponseImpl implements _AllProductResponse {
  const _$AllProductResponseImpl({required final List<ProductDetails> data})
      : _data = data;

  factory _$AllProductResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllProductResponseImplFromJson(json);

  final List<ProductDetails> _data;
  @override
  List<ProductDetails> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'AllProductResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllProductResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllProductResponseImplCopyWith<_$AllProductResponseImpl> get copyWith =>
      __$$AllProductResponseImplCopyWithImpl<_$AllProductResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllProductResponseImplToJson(
      this,
    );
  }
}

abstract class _AllProductResponse implements AllProductResponse {
  const factory _AllProductResponse(
      {required final List<ProductDetails> data}) = _$AllProductResponseImpl;

  factory _AllProductResponse.fromJson(Map<String, dynamic> json) =
      _$AllProductResponseImpl.fromJson;

  @override
  List<ProductDetails> get data;
  @override
  @JsonKey(ignore: true)
  _$$AllProductResponseImplCopyWith<_$AllProductResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductDetails _$ProductDetailsFromJson(Map<String, dynamic> json) {
  return _Datum.fromJson(json);
}

/// @nodoc
mixin _$ProductDetails {
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDetailsCopyWith<ProductDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsCopyWith<$Res> {
  factory $ProductDetailsCopyWith(
          ProductDetails value, $Res Function(ProductDetails) then) =
      _$ProductDetailsCopyWithImpl<$Res, ProductDetails>;
  @useResult
  $Res call(
      {String name, String image, int price, int quantity, String category});
}

/// @nodoc
class _$ProductDetailsCopyWithImpl<$Res, $Val extends ProductDetails>
    implements $ProductDetailsCopyWith<$Res> {
  _$ProductDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? price = null,
    Object? quantity = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatumImplCopyWith<$Res>
    implements $ProductDetailsCopyWith<$Res> {
  factory _$$DatumImplCopyWith(
          _$DatumImpl value, $Res Function(_$DatumImpl) then) =
      __$$DatumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, String image, int price, int quantity, String category});
}

/// @nodoc
class __$$DatumImplCopyWithImpl<$Res>
    extends _$ProductDetailsCopyWithImpl<$Res, _$DatumImpl>
    implements _$$DatumImplCopyWith<$Res> {
  __$$DatumImplCopyWithImpl(
      _$DatumImpl _value, $Res Function(_$DatumImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? price = null,
    Object? quantity = null,
    Object? category = null,
  }) {
    return _then(_$DatumImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DatumImpl implements _Datum {
  const _$DatumImpl(
      {this.name = '',
      this.image = '',
      this.price = 0,
      this.quantity = 0,
      this.category = ''});

  factory _$DatumImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatumImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final int price;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final String category;

  @override
  String toString() {
    return 'ProductDetails(name: $name, image: $image, price: $price, quantity: $quantity, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatumImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, image, price, quantity, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      __$$DatumImplCopyWithImpl<_$DatumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DatumImplToJson(
      this,
    );
  }
}

abstract class _Datum implements ProductDetails {
  const factory _Datum(
      {final String name,
      final String image,
      final int price,
      final int quantity,
      final String category}) = _$DatumImpl;

  factory _Datum.fromJson(Map<String, dynamic> json) = _$DatumImpl.fromJson;

  @override
  String get name;
  @override
  String get image;
  @override
  int get price;
  @override
  int get quantity;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
