import 'dart:async';

import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:diiket/data/services/dynamic_link_handlers.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DynamicLinkService {
  static DynamicLinkService? _dynamicLinkService;

  factory DynamicLinkService() {
    if (_dynamicLinkService == null) {
      _dynamicLinkService = DynamicLinkService._();
    }

    return _dynamicLinkService!;
  }

  late FirebaseDynamicLinks instance;

  DynamicLinkService._() {
    instance = FirebaseDynamicLinks.instance;
  }

  Future initializeHandler(BuildContext context) async {
    instance.onLink(
      onSuccess: (PendingDynamicLinkData? dynamicLink) async {
        final Uri? deepLink = dynamicLink?.link;

        if (deepLink != null) {
          _handleLink(context, deepLink);
        }
      },
      onError: (OnLinkErrorException exception) async {
        context.read(crashlyticsProvider).recordError(
              exception,
              null,
            );
      },
    );

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();

    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      _handleLink(context, deepLink);
    }
  }

  void _handleLink(BuildContext context, Uri deepLink) {
    final String? type = deepLink.queryParameters['type'];
    final String? alertMessage = deepLink.queryParameters['alertMessage'];

    if (alertMessage != null) {
      Utils.alert(context, alertMessage);
    }

    switch (type) {
      case 'stall':
        DynamicLinkHandlers.handleStallLink(context, deepLink);
    }
  }
}
