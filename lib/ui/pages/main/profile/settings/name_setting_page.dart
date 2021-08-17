import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/helpers/validation_helper.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/common/custom_app_bar.dart';
import 'package:diiket/ui/widgets/inputs/primary_button.dart';
import 'package:diiket/ui/widgets/orders/order_payment_detail.dart';
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
                      CustomTextFormField(
                        labelText: 'Nama Anda',
                        hintText: 'Contoh: Daniel Putri',
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

                                await authNotifier
                                    .updateUserName(controller.text);

                                if (isMounted()) {
                                  isLoading.value = false;

                                  Utils.alert('Nama berhasil diperbarui');

                                  Navigator.of(context).pop();
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

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.labelText,
    this.controller,
    this.keyboardType,
    this.textCapitalization,
    this.validator,
  }) : super(key: key);

  final String hintText;
  final String? labelText;

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final String? Function(String?)? validator;

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
          height: 52,
          decoration: kBorderedDecoration,
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 14.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.person_outline_rounded,
                color: ColorPallete.darkGray,
                size: 22.0,
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  keyboardType: keyboardType,
                  textCapitalization:
                      textCapitalization ?? TextCapitalization.none,
                  validator: validator,
                  decoration: InputDecoration.collapsed(hintText: hintText),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
