import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dynamicLinkGeneratorProvider = Provider<DynamicLinkGenerators>((ref) {
  return DynamicLinkGenerators(ref.watch(dynamicLinkProvider));
});

// ignore: avoid_classes_with_only_static_members
class DynamicLinkGenerators {
  final FirebaseDynamicLinks _dynamicLinkService;

  DynamicLinkGenerators(this._dynamicLinkService);

  Future<Uri> generateStallDeepLink(
    Stall stall, {
    Product? product,
    User? referrer,
  }) async {
    final int? marketId = stall.market_id;
    final int? stallId = stall.id;
    final int? productId = product?.id;

    if (stallId == null || marketId == null) {
      throw const CustomException(
        message: 'Stall ID and Market ID are required.',
      );
    }

    late GoogleAnalyticsParameters googleAnalyticsParameters;
    late SocialMetaTagParameters metaTagParameters;

    // set meta based if product is provided
    if (product != null && productId != null) {
      googleAnalyticsParameters = GoogleAnalyticsParameters(
        campaign: 'Product Referrer',
        medium: 'social',
        source: 'diiket-app-share',
      );

      metaTagParameters = SocialMetaTagParameters(
        title: '${product.name} | ${product.stall?.name}',
        description: product.description,
        imageUrl:
            product.photo_url != null ? Uri.parse(product.photo_url!) : null,
      );
    } else {
      googleAnalyticsParameters = GoogleAnalyticsParameters(
        campaign: 'Stall Referrer',
        medium: 'social',
        source: 'diiket-app-share',
      );

      metaTagParameters = SocialMetaTagParameters(
        title: stall.name,
        description: stall.description,
        imageUrl: stall.photo_url != null ? Uri.parse(stall.photo_url!) : null,
      );
    }

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://diiket.page.link',
      link: Uri.https(
        'diiket.web.app',
        '/launch',
        {
          'type': 'stall',
          'marketId': marketId.toString(),
          'stallId': stallId.toString(),
          if (productId != null) 'productId': productId.toString(),
          if (referrer?.id != null) 'referrerId': referrer!.id.toString(),
        },
      ),
      androidParameters: AndroidParameters(
        packageName: 'id.innodev.diiket',
        // open stall/product first implemented in version 0.0.4+4
        minimumVersion: 4,
      ),
      googleAnalyticsParameters: googleAnalyticsParameters,
      socialMetaTagParameters: metaTagParameters,
    );

    final ShortDynamicLink shortDynamicLink =
        await _dynamicLinkService.buildShortLink(parameters);
    final Uri shortUrl = shortDynamicLink.shortUrl;

    return shortUrl;
  }
}
