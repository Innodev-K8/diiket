import 'package:cached_network_image/cached_network_image.dart';
import 'package:diiket/data/models/stall.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:flutter/material.dart';

class MediumStallItem extends StatelessWidget {
  const MediumStallItem({
    Key? key,
    required this.stall,
  }) : super(key: key);

  final Stall stall;

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = BorderRadius.circular(15);

    return Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: [
          BoxShadow(
            offset: Offset(4, 15),
            blurRadius: 70,
            color: Colors.black.withOpacity(0.08),
          ),
        ],
      ),
      child: Material(
        color: ColorPallete.backgroundColor,
        borderRadius: radius,
        child: InkWell(
          borderRadius: radius,
          onTap: () {
            Utils.homeNav.currentState!.pushNamed(
              '/home/stall',
              arguments: {
                'stall_id': stall.id,
              },
            );
          },
          child: Container(
            width: 180,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: CachedNetworkImage(
                      imageUrl: stall.photo_url ??
                          'https://diiket.rejoin.id/images/placeholders/stall.jpg',
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: SizedBox(
                          width: 48,
                          height: 48,
                          child: CircularProgressIndicator(
                            color: ColorPallete.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  stall.name ?? '-',
                  style: kTextTheme.headline5,
                ),
                Text(
                  stall.is_open == true ? 'Buka' : 'Tutup',
                  style: kTextTheme.subtitle2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
