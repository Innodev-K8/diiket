import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/user.dart';
import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:diiket/helpers/validation_helper.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

enum MobileVerificationState {
  SHOW_PHONE_FORM,
  SHOW_OTP_FORM,
  SHOW_USERNAME_FORM,
}

class RegisterPage extends StatefulWidget {
  static final route = '/auth/register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // state ini digunakan untuk menentukan user memasukan no-telp atau kode otp
  MobileVerificationState curentState = MobileVerificationState.SHOW_PHONE_FORM;

  final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> userNameFormKey = GlobalKey<FormState>();

  final phoneNumberField = TextEditingController();
  final otpCodeField = TextEditingController();
  final userNameCodeField = TextEditingController();

  bool isLoading = false;
  String? verificationId;
  int? forceResendingToken;

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      provider: authProvider,
      onChange: (context, User? user) {
        if (user == null) {
          return;
        }

        if (user.name == null || user.name == '') {
          setState(() {
            isLoading = false;
            curentState = MobileVerificationState.SHOW_USERNAME_FORM;
          });
        } else {
          Utils.appNav.currentState?.pop();
        }
      },
      child: Scaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: AbsorbPointer(
            absorbing: isLoading,
            child: Stack(
              children: [
                AnimatedOpacity(
                  duration: Duration(milliseconds: 250),
                  opacity: isLoading ? 0.5 : 1,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      child: _buildContent(context),
                    ),
                  ),
                ),
                if (isLoading) _buildLoading(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    switch (curentState) {
      case MobileVerificationState.SHOW_PHONE_FORM:
        return _buildMobileForm(context);
      case MobileVerificationState.SHOW_OTP_FORM:
        return _buildOtpForm(context);
      case MobileVerificationState.SHOW_USERNAME_FORM:
        return _buildUserNameForm(context);
    }
  }

  Widget _buildMobileForm(BuildContext context) {
    return Form(
      key: phoneFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                color: Colors.grey,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('+62'),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: TextFormField(
                  controller: phoneNumberField,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Nomor Telepon',
                  ),
                  // validator: ValidationHelper.validateMobile,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              FocusScope.of(context).unfocus();

              if (!phoneFormKey.currentState!.validate()) return;

              setState(() {
                isLoading = true;
              });

              context.read(firebaseAuthProvider).verifyPhoneNumber(
                    phoneNumber: "+62 ${phoneNumberField.text}",
                    verificationCompleted: (phoneAuthCredential) {
                      _signInWithPhoneCredential(phoneAuthCredential);
                    },
                    verificationFailed: (error) {
                      setState(() {
                        curentState = MobileVerificationState.SHOW_PHONE_FORM;
                        isLoading = false;
                        this.verificationId = null;
                        this.forceResendingToken = null;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            error.message ?? 'Terjadi kesalahan',
                          ),
                        ),
                      );
                    },
                    codeSent: (verificationId, forceResendingToken) {
                      setState(() {
                        curentState = MobileVerificationState.SHOW_OTP_FORM;
                        isLoading = false;
                        this.verificationId = verificationId;
                        this.forceResendingToken = forceResendingToken;
                      });
                    },
                    codeAutoRetrievalTimeout: (verificationId) {
                      print('timeout');
                      print(verificationId);
                    },
                  );
            },
            child: Text('Kirim'),
          ),
        ],
      ),
    );
  }

  Widget _buildOtpForm(BuildContext context) {
    return Form(
      key: otpFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Verifikasi',
            style: kTextTheme.headline1,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Kami telah mengirim kode OTP ke nomor telpon Anda.',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 48,
          ),
          PinCodeTextField(
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,
            keyboardType: TextInputType.number,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.underline,
              borderRadius: BorderRadius.circular(4),
              inactiveColor: ColorPallete.deadColor,
              inactiveFillColor: ColorPallete.backgroundColor,
              activeColor: ColorPallete.successColor,
              activeFillColor: ColorPallete.backgroundColor,
              selectedColor: ColorPallete.primaryColor,
              selectedFillColor: ColorPallete.backgroundColor,
            ),
            animationDuration: Duration(milliseconds: 300),
            controller: otpCodeField,
            autoDisposeControllers: false,
            onCompleted: (otpCode) {
              _verifyOtpCode(otpCodeField.text);
            },
            appContext: context,
            onChanged: (String value) {},
          ),
          SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: ColorPallete.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 12.0)),
              onPressed: () {
                FocusScope.of(context).unfocus();

                _verifyOtpCode(otpCodeField.text);
              },
              child: Text('Verifikasi'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserNameForm(BuildContext context) {
    return Form(
      key: userNameFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Selamat Datang!',
            style: kTextTheme.headline1,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Silahkan masukan nama lengkap Anda sesuai KTP.',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 32,
          ),
          TextFormField(
            controller: userNameCodeField,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            validator: ValidationHelper.validateName,
          ),
          SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: ColorPallete.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 12.0)),
              onPressed: () async {
                FocusScope.of(context).unfocus();

                if (!userNameFormKey.currentState!.validate()) return;

                final name = userNameCodeField.text;

                setState(() {
                  isLoading = true;
                });

                await context.read(authProvider.notifier).updateUserName(name);

                // Utils.appNav.currentState?.pop();
              },
              child: Text('Simpan'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(
        color: ColorPallete.primaryColor,
      ),
    );
  }

  Future<void> _verifyOtpCode(String otpCode) async {
    if (verificationId == null)
      return setState(() {
        curentState = MobileVerificationState.SHOW_PHONE_FORM;
      });

    final phoneAuthCredential = firebaseAuth.PhoneAuthProvider.credential(
      verificationId: verificationId!,
      smsCode: otpCode,
    );

    await _signInWithPhoneCredential(phoneAuthCredential);
  }

  Future<void> _signInWithPhoneCredential(
      firebaseAuth.PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      isLoading = true;
    });

    try {
      await context
          .read(authProvider.notifier)
          .signInWithPhoneCredential(phoneAuthCredential);

      // Utils.appNav.currentState?.pop();
    } on CustomException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.message ?? 'Terjadi kesalahan',
          ),
        ),
      );

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    phoneNumberField.dispose();
    otpCodeField.dispose();
    userNameCodeField.dispose();

    super.dispose();
  }
}
