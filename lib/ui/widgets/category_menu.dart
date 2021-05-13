import 'package:diiket/ui/common/utils.dart';
import 'package:flutter/material.dart';

import 'category_button.dart';

class CategoryMenu extends StatelessWidget {
  const CategoryMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      children: [
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
          fileName: 'rice',
          text: 'Beras',
          onTap: () {},
        ),
        CategoryButton(
          fileName: 'fish',
          text: 'Ikan',
          onTap: () {},
        ),
        CategoryButton(
          fileName: 'meat',
          text: 'Daging',
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
        CategoryButton(
          fileName: 'season',
          text: 'Bumbu',
          onTap: () {},
        ),
      ],
    );
  }
}
