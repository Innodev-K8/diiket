import 'package:diiket/ui/widgets/auth/auth_wrapper.dart';
import 'package:diiket/ui/widgets/auth/login_to_continue_screen.dart';
import 'package:diiket/ui/widgets/common/custom_app_bar.dart';
import 'package:diiket/ui/widgets/history/history_list.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(title: 'Riwayat'),
          Expanded(
            child: AuthWrapper(
              isAnimated: false,
              guest: () => LoginToContinueScreen(),
              auth: (_) => HistoryList(),
            ),
          ),
        ],
      ),
    );
  }
}
