import 'package:diiket/data/network/market_service.dart';
import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket/data/secure_storage.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// implementations for link handlers, initialization on DynamicLinkService
class DynamicLinkHandlers {
  static Future<void> handleStallLink(
      BuildContext context, Uri deepLink) async {
    final int? stallId = int.tryParse(
      deepLink.queryParameters['stallId'] ?? '',
    );
    final int? productId = int.tryParse(
      deepLink.queryParameters['productId'] ?? '',
    );
    final int? marketId = int.tryParse(
      deepLink.queryParameters['marketId'] ?? '',
    );

    // cancel if stallId and productId is null
    if (stallId == null || marketId == null) return;

    try {
      final currentSelectedMarket = context.read(currentMarketProvider).state;

      if (currentSelectedMarket?.id != marketId) {
        final market =
            await context.read(marketServiceProvider).getMarketDetail(marketId);

        context.read(currentMarketProvider).state = market;

        await SecureStorage().setSelectedMarket(market);
      }

      Utils.navigateToStall(stallId, productId);
    } catch (exception, stackTrace) {
      context.read(crashlyticsProvider).recordError(
            exception,
            stackTrace,
            reason: 'dynamic-link-handler-stall-link-handler',
          );
    }
  }
}
