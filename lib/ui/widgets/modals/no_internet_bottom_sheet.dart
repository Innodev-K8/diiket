import 'dart:io';

import 'package:diiket/data/credentials.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/inputs/primary_button.dart';
import 'package:diiket/ui/widgets/orders/order_payment_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class NoInternetBottomSheet extends HookWidget {
  static Future<void> show(BuildContext context) {
    return showMaterialModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return NoInternetBottomSheet();
      },
    );
  }

  const NoInternetBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = useState<bool>(false);
    final isMounted = useIsMounted();

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();

        return false;
      },
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8),
        child: Container(
          decoration: BoxDecoration(
            color: ColorPallete.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14.0),
              topRight: Radius.circular(14.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 24.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.wifi_off_rounded,
                          color: ColorPallete.primaryColor,
                          size: 88,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Tidak dapat terhubung',
                          textAlign: TextAlign.center,
                          style: kTextTheme.headline4,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Cek koneksi WiFi atau jaringan seluler Anda dan coba lagi.',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 24),
                        SizedBox(
                          width: 128,
                          height: 38,
                          child: PrimaryButton(
                            // recheck network connection
                            onPressed: () async {
                              try {
                                isLoading.value = true;

                                final result = await InternetAddress.lookup(
                                  Uri.parse(Credentials.apiEndpoint).host,
                                );

                                if (result.isNotEmpty &&
                                    result[0].rawAddress.isNotEmpty) {
                                  Navigator.of(context).pop();
                                } else {
                                  Utils.alert(
                                    'Masih belum dapat terhubung dengan jaringan',
                                  );
                                }
                              } catch (_) {
                                Utils.alert(
                                  'Masih belum dapat terhubung dengan jaringan',
                                );
                              } finally {
                                if (isMounted()) {
                                  isLoading.value = false;
                                }
                              }
                            },
                            child: isLoading.value
                                ? SmallLoading()
                                : Text('Coba Lagi'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
