import 'package:diiket/data/models/market.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentMarketProvider = StateProvider<Market>((ref) {
  // default market pake id 1,
  return Market(id: 1);
});
