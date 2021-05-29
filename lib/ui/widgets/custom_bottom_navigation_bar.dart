import 'package:diiket/data/providers/main_page_controller_provider.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomBottomNavigationBar extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final pageController = useProvider(mainPageController.notifier);
    final pageControllerState = useProvider(mainPageController);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      height: 70.0,
      decoration: BoxDecoration(
        color: ColorPallete.backgroundColor,
        border: Border(
          top: BorderSide(
            color: ColorPallete.lightGray.withOpacity(0.5),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomBarButton(
            isSelected: pageControllerState == 0,
            image: 'assets/images/bottom_bar/home.png',
            title: 'Pasar',
            onTap: () async {
              pageController.setPage(0);
            },
          ),
          Consumer(builder: (context, watch, child) {
            watch(activeOrderProvider);

            final int itemCount =
                context.read(activeOrderProvider.notifier).orderCount;

            return Stack(
              children: [
                BottomBarButton(
                  isSelected: pageControllerState == 1,
                  image: 'assets/images/bottom_bar/cart.png',
                  title: 'Keranjang',
                  onTap: () async {
                    pageController.setPage(1);
                  },
                ),
                if (itemCount > 0)
                  Positioned(
                    top: 8,
                    right: 24,
                    child: Entry.scale(
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: ColorPallete.secondaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '$itemCount',
                            textAlign: TextAlign.center,
                            style: kTextTheme.caption!.copyWith(
                              color: ColorPallete.backgroundColor,
                              fontSize: 8.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            );
          }),
          BottomBarButton(
            isSelected: pageControllerState == 2,
            image: 'assets/images/bottom_bar/history.png',
            title: 'Riwayat',
            onTap: () async {
              pageController.setPage(2);
            },
          ),
          BottomBarButton(
            isSelected: pageControllerState == 3,
            image: 'assets/images/bottom_bar/profile.png',
            title: 'Profil',
            onTap: () async {
              pageController.setPage(3);
            },
          ),
        ],
      ),
    );
  }
}

class BottomBarButton extends StatelessWidget {
  final bool isSelected;
  final Function() onTap;
  final String image;
  final String title;

  const BottomBarButton({
    Key? key,
    required this.isSelected,
    required this.onTap,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image,
              color: isSelected
                  ? ColorPallete.primaryColor
                  : ColorPallete.lightGray,
              width: 24,
              height: 24,
            ),
            Text(
              title,
              style: isSelected
                  ? TextStyle(
                      color: ColorPallete.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0,
                    )
                  : TextStyle(
                      color: ColorPallete.lightGray,
                      fontSize: 12.0,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
