import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/category_button.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pasar',
                  style: kTextTheme.headline1,
                ),
                CircleAvatar(
                  radius: 22,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xFFF2F3F4),
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: 'Bumbu, Daging Sapi',
                suffixIcon: Icon(
                  Icons.search,
                  color: ColorPallete.deadColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Text(
              'Kategori',
              style: kTextTheme.headline2,
            ),
          ),
          Container(
            child: GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                CategoryButton(
                  fileName: 'rice',
                  text: 'Beras',
                ),
                CategoryButton(
                  fileName: 'bread',
                  text: 'Roti',
                ),
                CategoryButton(
                  fileName: 'rice',
                  text: 'Beras',
                ),
                CategoryButton(
                  fileName: 'fish',
                  text: 'Ikan',
                ),
                CategoryButton(
                  fileName: 'meat',
                  text: 'Daging',
                ),
                CategoryButton(
                  fileName: 'vegetable',
                  text: 'Sayur',
                ),
                CategoryButton(
                  fileName: 'fruit',
                  text: 'Buah',
                ),
                CategoryButton(
                  fileName: 'season',
                  text: 'Bumbu',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
