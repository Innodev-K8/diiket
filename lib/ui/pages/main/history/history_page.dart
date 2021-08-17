import 'package:diiket/data/providers/order/order_history_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/widgets/auth/auth_wrapper.dart';
import 'package:diiket/ui/widgets/auth/login_to_continue_screen.dart';
import 'package:diiket/ui/widgets/common/custom_app_bar.dart';
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
            child: LayoutBuilder(
              builder: (context, constraints) => RefreshIndicator(
                onRefresh: () => context
                    .read(orderHistoryProvider.notifier)
                    .retrieveOrderHistory(),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    // add height constraint when error so that the error message can be centered
                    height: historyState.maybeWhen(
                      error: (_, __) => true,
                      orElse: () => false,
                    )
                        ? constraints.minHeight
                        : null,
                    child: AuthWrapper(
                      isAnimated: false,
                      guest: () => LoginToContinueScreen(),
                      auth: (_) => historyState.when(
                        data: (orders) => HistoryList(orders: orders),
                        loading: () => HistoryListLoading(),
                        error: (error, stackTrace) => Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.production_quantity_limits_rounded,
                                color: ColorPallete.primaryColor,
                                size: 88,
                              ),
                              SizedBox(height: 12),
                              Text(
                                'Terjadi kesalahan, tarik untuk memuat ulang...',
                                textAlign: TextAlign.center,
                                style: kTextTheme.headline6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
