import 'package:diiket/ui/widgets/search_field.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final bool autofocus;

  const SearchPage({
    Key? key,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 30,
                bottom: 24,
              ),
              child: Hero(
                tag: 'search-field',
                child: SearchField(
                  autofocus: autofocus,
                ),
              ),
            ),
            Text('Ini search page'),
          ],
        ),
      ),
    );
  }
}
