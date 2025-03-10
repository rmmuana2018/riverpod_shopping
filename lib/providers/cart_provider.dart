import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/product.dart';

part 'cart_provider.g.dart';

//region Auto-generated of Notifier & NotifierProvider using dart run build_runner watch
@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Set<Product> build() => const {};

  void addProduct(Product product) {
    if (!state.contains(product)) state = {...state, product};
  }

  void removeProduct(Product product) {
    if (state.contains(product)) state = state.where((p) => p.id != product.id).toSet();
  }
}

@riverpod
int cartTotal(ref) {
  final cartProducts = ref.watch(cartNotifierProvider);
  int total = 0;
  for (final Product product in cartProducts) {
    total += product.price;
  }
  return total;
}
//endregion

//region Manual Creation of Notifier & NotifierProvider
// class CartNotifier extends Notifier<Set<Product>> {
//   @override
//   Set<Product> build() => const {Product(id: '4', title: 'Red Backpack', price: 14, image: 'assets/images/products/backpack.png')};
//
//   void addProduct(Product product) {
//     if (!state.contains(product)) state = {...state, product};
//   }
//
//   void removeProduct(Product product) {
//     if (state.contains(product)) state = state.where((p) => p.id != product.id).toSet();
//   }
// }
//
// final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() => CartNotifier());
//endregion
