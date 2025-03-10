import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/product.dart';

part 'products_provider.g.dart';

const List<Product> allProducts = [
  Product(id: '1', title: 'Groovy Shorts', price: 12, image: 'assets/images/products/shorts.png'),
  Product(id: '2', title: 'Karate Kit', price: 34, image: 'assets/images/products/karate.png'),
  Product(id: '3', title: 'Denim Jeans', price: 54, image: 'assets/images/products/jeans.png'),
  Product(id: '4', title: 'Red Backpack', price: 14, image: 'assets/images/products/backpack.png'),
  Product(id: '5', title: 'Drum & Sticks', price: 29, image: 'assets/images/products/drum.png'),
  Product(id: '6', title: 'Blue Suitcase', price: 44, image: 'assets/images/products/suitcase.png'),
  Product(id: '7', title: 'Roller Skates', price: 52, image: 'assets/images/products/skates.png'),
  Product(id: '8', title: 'Electric Guitar', price: 79, image: 'assets/images/products/guitar.png'),
];

// generated providers using dart run build_runner watch
@riverpod
List<Product> products(ref) => allProducts;

@riverpod
List<Product> reducedProducts(ref) => allProducts.where((product) => product.price < 50).toList();

// manual
// final productsProvider = Provider((ref) => allProducts);
// final reducedProductsProvider = Provider((ref) => allProducts.where((product) => product.price < 50));
