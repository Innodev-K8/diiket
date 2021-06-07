import 'package:diiket/data/providers/stall/favorite_stall_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/widgets/stall/medium_stall_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteStalls extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final stalls = useProvider(favoriteStallProvider);

    if (stalls.isEmpty) return SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        if (stalls.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text('Belum ada langganan'),
          )
        else
          SizedBox(
            height: 240.0,
            child: ListView.separated(
              clipBehavior: Clip.none,
              itemCount: stalls.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              separatorBuilder: (context, index) => SizedBox(width: 15.0),
              itemBuilder: (context, index) =>
                  MediumStallItem(stall: stalls[index]),
            ),
          ),
      ],
    );
  }

  Padding _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 20,
        top: 24,
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Langganan',
            style: kTextTheme.headline2,
          ),
        ],
      ),
    );
  }
}
