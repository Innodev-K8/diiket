import 'package:diiket/data/models/market.dart';
import 'package:diiket/data/network/market_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentMarketProvider = StateProvider<Market>((ref) {
  final nearbyMarkets = ref.watch(nearbyMarketsProvider).data?.value;

  // default market pake id 1,
  return nearbyMarkets?.first ?? const Market(id: 1);
});

final nearbyMarketsProvider = FutureProvider<List<Market>>((ref) {
  return ref.read(marketServiceProvider).getNearbyMarket();
});
