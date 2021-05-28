import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomBottomNavigationBar extends HookWidget {
  final duration = const Duration(milliseconds: 250);
  final curves = Curves.easeInOutSine;

  const CustomBottomNavigationBar({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);

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
            isSelected: selectedIndex.value == 0,
            image: 'assets/images/bottom_bar/home.png',
            title: 'Pasar',
            onTap: () async {
              selectedIndex.value = 0;

              await pageController.animateToPage(
                0,
                duration: duration,
                curve: curves,
              );

              Utils.resetHomeNavigation();
            },
          ),
          Consumer(builder: (context, watch, child) {
            watch(activeOrderProvider);

            final int itemCount =
                context.read(activeOrderProvider.notifier).orderCount;

            return Stack(
              children: [
                  BottomBarButton(
                  isSelected: selectedIndex.value == 1,
                  image: 'assets/images/bottom_bar/cart.png',
                  title: 'Keranjang',
                  onTap: () async {
                    selectedIndex.value = 1;

                    await pageController.animateToPage(
                      1,
                      duration: duration,
                      curve: curves,
                    );

                    Utils.resetHomeNavigation();
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
            isSelected: selectedIndex.value == 2,
            image: 'assets/images/bottom_bar/history.png',
            title: 'Riwayat',
            onTap: () async {
              selectedIndex.value = 2;

              await pageController.animateToPage(
                2,
                duration: duration,
                curve: curves,
              );

              Utils.resetHomeNavigation();
            },
          ),
          BottomBarButton(
            isSelected: selectedIndex.value == 3,
            image: 'assets/images/bottom_bar/profile.png',
            title: 'Profil',
            onTap: () async {
              selectedIndex.value = 3;

              await pageController.animateToPage(
                3,
                duration: duration,
                curve: curves,
              );

              Utils.resetHomeNavigation();
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
