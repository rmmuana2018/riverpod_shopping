import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_shopping/providers/cart_provider.dart';

import '../../providers/products_provider.dart';
import '../../widgets/cart_icon.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20, childAspectRatio: 0.9),
          itemBuilder: (ctx, idx) => Container(
            padding: const EdgeInsets.all(20),
            color: Colors.blueGrey.withOpacity(0.05),
            child: Column(
              children: [
                Image.asset(allProducts[idx].image, width: 60, height: 60),
                Text(allProducts[idx].title),
                Text('Php ${allProducts[idx].price}'),
                cartProducts.contains(allProducts[idx])
                    ? TextButton(onPressed: () => ref.read(cartNotifierProvider.notifier).removeProduct(allProducts[idx]), child: const Text('Remove'))
                    : TextButton(onPressed: () => ref.read(cartNotifierProvider.notifier).addProduct(allProducts[idx]), child: const Text('Add to Cart')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
