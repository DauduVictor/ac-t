import 'dart:convert';

import 'package:acm_test/core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class FakeUri extends Fake implements Uri {}

class MockClient extends Mock implements http.Client {}

void main() {
  late MockClient mockClient;
  late ProductRepository productRepository;

  setUp(() {
    registerFallbackValue(FakeUri());

    mockClient = MockClient();
    productRepository = ProductRepository(
      client: mockClient,
    );
  });

  const tProduct0 = Product(
    name: 'name',
    image: 'image',
    price: 500,
    quantity: 0,
    category: 'category',
  );

  const tProduct1 = Product(
    name: 'name',
    image: 'image',
    price: 500,
    quantity: 1,
    category: 'category',
  );

  final tProducts = [tProduct0, tProduct1];

  final tProductsMap = [
    tProduct0.toJson(),
    tProduct1.toJson(),
  ];

  final tCategories = ['skin', 'hair', 'face'];

  group('ProductRepository', () {
    test('successfully creates ProductRepository with default values', () {
      expect(ProductRepository(), isA<ProductRepository>());
    });

    group('getProducts', () {
      test('returns a List<Product>', () async {
        final tResponse = http.Response(
          jsonEncode({'data': tProductsMap}),
          200,
        );
        when(
          () => mockClient.get(
            any(),
            headers: {'content-type': 'application/json'},
          ),
        ).thenAnswer((_) async => tResponse);

        final result = await productRepository.getAllProducts();

        expect(result, tProducts);
      });

      test(
        'returns GetProductsException '
        'when statusCode is not 200',
        () {
          final tResponse = http.Response(jsonEncode(<String, dynamic>{}), 403);
          when(
            () => mockClient
                .get(any(), headers: {'content-type': 'application/json'}),
          ).thenAnswer((_) async => tResponse);
          expect(
            productRepository.getAllProducts(
              category: 'category',
            ),
            throwsA(isA<ProductException>()),
          );
        },
      );
    });

    group('getCategories', () {
      test('returns a List<String>', () async {
        final tResponse = http.Response(
          jsonEncode({'data': tCategories}),
          200,
        );
        when(
          () => mockClient.get(
            any(),
            headers: {'content-type': 'application/json'},
          ),
        ).thenAnswer((_) async => tResponse);

        final result = await productRepository.getAllCategories();

        expect(result, tCategories);
      });

      test(
        'returns GetProductsException '
        'when statusCode is not 200',
        () {
          final tResponse = http.Response(jsonEncode(<String, dynamic>{}), 403);
          when(
            () => mockClient
                .get(any(), headers: {'content-type': 'application/json'}),
          ).thenAnswer((_) async => tResponse);
          expect(
            productRepository.getAllCategories(),
            throwsA(isA<ProductException>()),
          );
        },
      );
    });
  });
}
