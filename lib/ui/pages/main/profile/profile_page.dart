import 'package:diiket/data/models/market.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket/data/providers/products/products_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/auth/register_page.dart';
import 'package:diiket/ui/widgets/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfilePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final String productCategory = ProductFamily.all;

    // final activeOrderState = useProvider(activeOrderProvider);
    final productsState = useProvider(productProvider(productCategory));
    // final stallState = useProvider(stallProvider);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ini Profile Page'),
            AuthWrapper(
              auth: (user) => Column(
                children: [
                  Text('Logged as ${user.name}'),
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(user.profile_picture_url ?? ''),
                  ),
                ],
              ),
            ),
            AuthWrapper(
              auth: (user) => ElevatedButton(
                onPressed: () {
                  context.read(authProvider.notifier).signOut();
                },
                child: Text('Sign Out'),
              ),
              guest: ElevatedButton(
                onPressed: () {
                  Utils.appNav.currentState?.pushNamed(RegisterPage.route);
                },
                child: Text('Login'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .read(productProvider(productCategory).notifier)
                    .loadProducts();
              },
              child: Text('Refresh'),
            ),
            ElevatedButton(
              onPressed: () {
                final currentMarket = context.read(currentMarketProvider).state;

                if (currentMarket.id == 1) {
                  context.read(currentMarketProvider).state = Market(id: 2);
                } else {
                  context.read(currentMarketProvider).state = Market(id: 1);
                }
              },
              child: Text('Ganti Pasar'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     context.read(activeOrderProvider.notifier).placeOrderItem(
            //           Product(id: 1),
            //           2,
            //           'Yang banyak pak kuahnya...',
            //         );
            //   },
            //   child: Text('Place Order'),
            // ),
            ElevatedButton(
              onPressed: () {
                context
                    .read(productProvider(productCategory).notifier)
                    .loadMore();
              },
              child: Text('Load More'),
            ),
            productsState.when(
              data: (value) => Column(
                children:
                    value.data?.map((p) => _buildProductItem(p)).toList() ?? [],
              ),
              loading: () => Text('loading'),
              error: (error, stackTrace) => Text(
                error.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }


  // ignore: unused_element
  Widget _buildProductItem(Product p) {
    final String? category = p.categories?.map((e) => e.name).join(', ');

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(p.photo_url ?? ''),
              ),
              SizedBox(width: 4),
              Text(
                p.name ?? '-',
                style: kTextTheme.headline6,
              ),
            ],
          ),
          Text(p.description ?? '-'),
          Text('${p.price}/${p.quantity_unit}'),
          Text('Pedagang: ${p.stall?.seller?.name} - ${p.stall?.name}'),
          Text('Kategori: ${category}'),
        ],
      ),
    );
  }
}
