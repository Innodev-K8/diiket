import 'package:diiket/ui/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SearchField extends HookWidget {
  final Function()? onTap;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool autofocus;
  final bool enabled;
  final bool showClearButton;

  const SearchField({
    Key? key,
    this.onTap,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
    this.enabled = true,
    this.showClearButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = useState<String?>(null);

    return TextField(
      onTap: onTap,
      controller: controller,
      autofocus: autofocus,
      enabled: enabled,
      onChanged: (value) {
        text.value = value;
        onChanged?.call(value);
      },
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: showClearButton || (text.value != null && text.value != '')
            ? IconButton(
                icon: Icon(
                  Icons.clear_rounded,
                  color: ColorPallete.lightGray,
                ),
                onPressed: () {
                  controller?.text = '';
                  text.value = '';
                  onChanged?.call('');
                },
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ColorPallete.lightGray,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ColorPallete.lightGray.withOpacity(0.5),
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
            color: ColorPallete.lightGray,
          ),
        ),
      ),
    );
  }
}
