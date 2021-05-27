import 'package:diiket/ui/common/styles.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function()? onTap;
  final bool autofocus;
  final bool enabled;

  const SearchField({
    Key? key,
    this.onTap,
    this.autofocus = false,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      autofocus: autofocus,
      enabled: enabled,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ColorPallete.deadColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2.0,
            color: ColorPallete.primaryColor,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: 'Bumbu, Daging Sapi',
        suffixIconConstraints: BoxConstraints(
          minHeight: 24,
          minWidth: 24,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            'assets/images/categories/search.png',
            width: 24,
            height: 24,
            color: ColorPallete.deadColor,
          ),
        ),
      ),
    );
  }
}
