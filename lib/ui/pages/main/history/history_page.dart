import 'package:diiket/data/providers/order/order_history_provider.dart';
import 'package:diiket/ui/widgets/auth/auth_wrapper.dart';
import 'package:diiket/ui/widgets/auth/login_to_continue_screen.dart';
import 'package:diiket/ui/widgets/common/custom_app_bar.dart';
import 'package:diiket/ui/widgets/common/custom_exception_message.dart';
import 'package:diiket/ui/widgets/history/history_list.dart';
import 'package:diiket/ui/widgets/history/loading/history_list_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final historyState = useProvider(orderHistoryProvider);

    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(title: 'Riwayat'),
          Expanded(
            child: AuthWrapper(
              isAnimated: false,
              guest: () => LoginToContinueScreen(),
              auth: (_) => historyState.when(
                data: (orders) => RefreshIndicator(
                  onRefresh: () => context
                      .read(orderHistoryProvider.notifier)
                      .retrieveOrderHistory(),
                  child: HistoryList(orders: orders),
                ),
                loading: () => HistoryListLoading(),
                error: (error, stackTrace) => CustomExceptionMessage(error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
