import 'package:diiket/ui/common/utils.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ini Feed Page'),
          ElevatedButton(
            onPressed: () {
              Utils.homeNav.currentState?.pushNamed('/home/stall');
            },
            child: Text('Ke detail toko'),
          ),
        ],
      ),
    );
  }
}
