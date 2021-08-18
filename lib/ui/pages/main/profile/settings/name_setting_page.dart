import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/common/custom_app_bar.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NameSettingPage extends HookWidget {
  static String route = '/settings/name';

  @override
  Widget build(BuildContext context) {
    final user = useProvider(authProvider);

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final controller = useTextEditingController(text: user!.name);
    final inputValue = useState(user.name);
    final isLoading = useState(false);
    final isMounted = useIsMounted();

    useEffect(() {
      void onChange() {
        inputValue.value = controller.text;
      }

      controller.addListener(onChange);

      return () => controller.removeListener(onChange);
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: 'Ubah Nama',
              showBackButton: true,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BorderedCustomTextFormField(
                        labelText: 'Nama Anda',
                        hintText: 'Contoh: Daniel Putri',
                        icon: Icon(
                          Icons.person_outline_rounded,
                          color: ColorPallete.darkGray,
                          size: 22.0,
                        ),
                        controller: controller,
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        validator: ValidationHelper.validateName,
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              withShadow: false,
                              disabled: inputValue.value == null ||
                                  inputValue.value!.isEmpty ||
                                  user.name == inputValue.value,
                              onPressed: () async {
                                FocusScope.of(context).unfocus();

                                if (!formKey.currentState!.validate()) return;

                                final authNotifier =
                                    context.read(authProvider.notifier);

                                isLoading.value = true;

                                try {
                                  await authNotifier
                                      .updateUserName(controller.text);

                                  Utils.alert('Nama berhasil diperbarui');

                                  Navigator.of(context).pop();

                                  // exception is already handled by the provider and being listened by the listener on main.dart
                                } finally {
                                  if (isMounted()) {
                                    isLoading.value = false;
                                  }
                                }
                              },
                              child: isLoading.value
                                  ? SmallLoading(
                                      color: Colors.white,
                                    )
                                  : Text('Simpan'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BorderedCustomTextFormField extends StatelessWidget {
  const BorderedCustomTextFormField({
    Key? key,
    this.hintText,
    this.labelText,
    this.icon,
    this.controller,
    this.initialValue,
    this.keyboardType,
    this.textCapitalization,
    this.validator,
    this.minLines,
    this.maxLines,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final Widget? icon;

  final TextEditingController? controller;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final String? Function(String?)? validator;
  final int? minLines;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: kTextTheme.headline5,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
        ],
        Container(
          // height: 52,
          decoration: kBorderedDecoration,
          padding: (maxLines ?? 0) > 1
              ? const EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 8.0,
                )
              : const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 14.0,
                ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (icon != null) icon!,
              SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  initialValue: initialValue,
                  keyboardType: keyboardType,
                  textCapitalization:
                      textCapitalization ?? TextCapitalization.none,
                  validator: validator,
                  decoration: InputDecoration.collapsed(hintText: hintText),
                  minLines: minLines,
                  maxLines: maxLines,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
