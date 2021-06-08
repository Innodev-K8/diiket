import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/pages/main/home/product/products_by_category_page.dart';
import 'package:flutter/material.dart';

import 'category_button.dart';

class CategoryMenu extends StatelessWidget {
  CategoryMenu({
    Key? key,
  }) : super(key: key);

  final _categories = [
    CategoryButton(
      fileName: 'meat',
      text: 'Daging',
      onTap: () {
        Utils.homeNav.currentState!.pushNamed(
          ProductsByCategoryPage.route,
          arguments: {
            'category': 'daging',
            'label': 'Daging Segar',
          },
        );
      },
    ),
    CategoryButton(
      fileName: 'fish',
      text: 'Ikan',
      onTap: () {
        Utils.homeNav.currentState!.pushNamed(
          ProductsByCategoryPage.route,
          arguments: {
            'category': 'ikan',
            'label': 'Ikan Segar',
          },
        );
      },
    ),
    CategoryButton(
      fileName: 'season',
      text: 'Bumbu',
      onTap: () {
        Utils.homeNav.currentState!.pushNamed(
          ProductsByCategoryPage.route,
          arguments: {
            'category': 'bumbu',
            'label': 'Bumbu Dapur',
          },
        );
      },
    ),
    CategoryButton(
      fileName: 'rice',
      text: 'Beras',
      onTap: () {
        Utils.homeNav.currentState!.pushNamed(
          ProductsByCategoryPage.route,
          arguments: {
            'category': 'beras',
            'label': 'Beras',
          },
        );
      },
    ),
    CategoryButton(
      fileName: 'bread',
      text: 'Roti',
      onTap: () {
        Utils.homeNav.currentState!.pushNamed(
          ProductsByCategoryPage.route,
          arguments: {
            'category': 'roti',
            'label': 'Roti',
          },
        );
      },
    ),
    CategoryButton(
      fileName: 'vegetable',
      text: 'Sayur',
      onTap: () {
        Utils.homeNav.currentState!.pushNamed(
          ProductsByCategoryPage.route,
          arguments: {
            'category': 'sayur',
            'label': 'Sayuran Segar',
          },
        );
      },
    ),
    CategoryButton(
      fileName: 'fruit',
      text: 'Buah',
      onTap: () {
        Utils.homeNav.currentState!.pushNamed(
          ProductsByCategoryPage.route,
          arguments: {
            'category': 'buah',
            'label': 'Buah-buahan',
          },
        );
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView.separated(
        itemCount: _categories.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        itemBuilder: (context, index) => _categories[index],
        separatorBuilder: (context, index) => SizedBox(width: 10),
      ),
    );
  }
}
