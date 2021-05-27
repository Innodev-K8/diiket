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
      onTap: () {},
    ),
    CategoryButton(
      fileName: 'fish',
      text: 'Ikan',
      onTap: () {},
    ),
    CategoryButton(
      fileName: 'season',
      text: 'Bumbu',
      onTap: () {},
    ),
    CategoryButton(
      fileName: 'rice',
      text: 'Beras',
      onTap: () {
        // Utils.homeNav.currentState!.pushNamed('/home/search');
      },
    ),
    CategoryButton(
      fileName: 'bread',
      text: 'Roti',
      onTap: () {},
    ),
    CategoryButton(
      fileName: 'vegetable',
      text: 'Sayur',
      onTap: () {},
    ),
    CategoryButton(
      fileName: 'fruit',
      text: 'Buah',
      onTap: () {},
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
