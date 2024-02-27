import 'package:acm_test/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const name = 'name';
  const image = 'image';
  const price = 500;
  const quantity = 2;
  const category = 'category';

  const tProduct = Product(
    name: name,
    image: image,
    price: price,
    quantity: quantity,
    category: category,
  );

  final tProductMap = {
    'name': name,
    'image': image,
    'price': price,
    'quantity': quantity,
    'category': category,
  };

  group('ProductModel', () {
    group('toJson', () {
      test('should return valid Map<String, dynamic>', () {
        expect(tProduct.toJson(), tProductMap);
      });
    });

    group('fromJson', () {
      test('should return valid User', () {
        expect(Product.fromJson(tProductMap), tProduct);
      });
    });
  });
}
