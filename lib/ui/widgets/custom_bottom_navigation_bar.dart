import 'package:diiket/ui/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomBottomNavigationBar extends HookWidget {
  final duration = const Duration(milliseconds: 300);

  const CustomBottomNavigationBar({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);

    useEffect(() {
      void onPageChange() {
        currentIndex.value = pageController.page?.toInt() ?? 0;
      }

      pageController.addListener(onPageChange);

      return () {
        pageController.removeListener(onPageChange);
      };
    }, const []);

    return Container(
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 7.0,
              color: Colors.black.withOpacity(0.24),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomBarButton(
            isSelected: currentIndex.value == 0,
            image: 'assets/images/bottom_bar/home.png',
            onTap: () async {
              // pageController.jumpToPage(0);

              await pageController.animateToPage(
                0,
                duration: duration,
                curve: Curves.easeInOut,
              );

              Utils.resetHomeNavigation();
            },
          ),
          BottomBarButton(
            isSelected: currentIndex.value == 1,
            image: 'assets/images/bottom_bar/cart.png',
            onTap: () async {
              // pageController.jumpToPage(1);

              await pageController.animateToPage(
                1,
                duration: duration,
                curve: Curves.easeInOut,
              );

              Utils.resetHomeNavigation();
            },
          ),
          BottomBarButton(
            isSelected: currentIndex.value == 2,
            image: 'assets/images/bottom_bar/history.png',
            onTap: () async {
              // pageController.jumpToPage(2);

              await pageController.animateToPage(
                2,
                duration: duration,
                curve: Curves.easeInOut,
              );

              Utils.resetHomeNavigation();
            },
          ),
          BottomBarButton(
            isSelected: currentIndex.value == 3,
            image: 'assets/images/bottom_bar/profile.png',
            onTap: () async {
              // pageController.jumpToPage(3);

              await pageController.animateToPage(
                3,
                duration: duration,
                curve: Curves.easeInOut,
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

  const BottomBarButton({
    Key? key,
    required this.isSelected,
    required this.onTap,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      width: 54.0,
      height: 54.0,
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFFFF8527) : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            image,
            color: isSelected ? Colors.white : Color(0xFF636773),
          ),
        ),
      ),
    );
  }
}
