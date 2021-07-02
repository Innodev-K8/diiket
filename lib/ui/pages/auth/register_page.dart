import 'dart:async';

import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/user.dart';
import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:diiket/helpers/validation_helper.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/common/utils.dart';
import 'package:diiket/ui/widgets/primary_button.dart';
import 'package:entry/entry.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:flutter/foundation.dart';
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

  Timer? resendTimer;
  int resendTimeoutCounter = 30;

  void startTimer() {
    resendTimer?.cancel();

    const oneSec = const Duration(seconds: 1);
    resendTimer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (resendTimeoutCounter == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            resendTimeoutCounter--;
          });
        }
      },
    );
  }

  void resetTimer() {
    resendTimer?.cancel();
    resendTimeoutCounter = 30;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        switch (curentState) {
          case MobileVerificationState.SHOW_PHONE_FORM:
            return true;
          case MobileVerificationState.SHOW_OTP_FORM:
            _cancelConfirmingOtp();

            return false;
          case MobileVerificationState.SHOW_USERNAME_FORM:
            // dissalow back here
            return false;
        }
      },
      child: ProviderListener(
        provider: authExceptionProvider,
        onChange: _onAuthException,
        child: ProviderListener(
          provider: authProvider,
          onChange: _onAuthStateChanges,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
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
        ),
      ),
    );
  }

  void _onAuthException(
      BuildContext context, StateController<CustomException?> e) {
    if (e.state != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.state!.message ?? 'Terjadi kesalahan',
          ),
        ),
      );

      setState(() {
        isLoading = false;
      });
    }
  }

  void _onAuthStateChanges(BuildContext context, User? user) {
    if (user == null) {
      return;
    }

    if (user.name == null || user.name == '') {
      setState(() {
        isLoading = false;
        curentState = MobileVerificationState.SHOW_USERNAME_FORM;
      });
    } else {
      Utils.resetAppNavigation();
    }
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                DiiketLogo(),
                SizedBox(height: 30),
                Text('Selamat Datang', style: kTextTheme.headline1),
                SizedBox(height: 5),
                Text('Masukan nomor telepon anda untuk melanjutkan'),
                SizedBox(height: 37),
                Container(
                  decoration: kBorderedDecoration,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 14.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.phone_android_rounded,
                        color: ColorPallete.darkGray,
                        size: 22.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '+62',
                          style: kTextTheme.bodyText2!.copyWith(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: TextFormField(
                            controller: phoneNumberField,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration.collapsed(
                              hintText: 'Nomor telepon anda',
                            ),
                            onChanged: (_) => setState(() {}),
                            // validator:
                            //     kDebugMode ? null : ValidationHelper.validateMobile,
                            validator: ValidationHelper.validateMobile,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 37),
              ],
            ),
          ),
          SizedBox(
            width: 120,
            height: 48,
            child: PrimaryButton(
              disabled: phoneNumberField.text.isEmpty,
              onPressed: () {
                FocusScope.of(context).unfocus();

                if (!phoneFormKey.currentState!.validate()) return;

                _sendSmsVerificationCode();
              },
              child: Text('Lanjut'),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.1,
            ),
            child: Text(
              'Selanjutnya, Anda akan menerima SMS untuk verifikasi. Tarif pesan dan data mungkin berlaku.',
              style: kTextTheme.overline,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtpForm(BuildContext context) {
    return Form(
      key: otpFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                InkWell(
                  onTap: _cancelConfirmingOtp,
                  borderRadius: BorderRadius.circular(999),
                  child: Container(
                    decoration: BoxDecoration(
                      border: kBorderedDecoration.border,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Icon(
                      Icons.chevron_left_rounded,
                      size: 42,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Verifikasi',
                  style: kTextTheme.headline1,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Silakan masukkan 6 digit kode yang sudah kami kirin ke nomer Anda di +62 ${phoneNumberField.value.text}.',
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 48,
                ),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  // validator: ValidationHelper.validateOtp,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    borderRadius: BorderRadius.circular(4),
                    inactiveColor: ColorPallete.lightGray,
                    inactiveFillColor: ColorPallete.backgroundColor,
                    activeColor: ColorPallete.successColor,
                    activeFillColor: ColorPallete.backgroundColor,
                    selectedColor: ColorPallete.primaryColor,
                    selectedFillColor: ColorPallete.backgroundColor,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  controller: otpCodeField,
                  autoDisposeControllers: false,
                  // onCompleted: (otpCode) {
                  //   _verifyOtpCode(otpCodeField.text);
                  // },
                  appContext: context,
                  onChanged: (String value) {
                    setState(() {});
                  },
                ),
                SizedBox(height: 14),
              ],
            ),
          ),
          SizedBox(
            width: 120,
            height: 48,
            child: PrimaryButton(
              disabled: otpCodeField.text.length != 6,
              onPressed: () {
                FocusScope.of(context).unfocus();

                if (!otpFormKey.currentState!.validate()) return;

                _verifyOtpCode(otpCodeField.text);
              },
              child: Text('Lanjut'),
            ),
          ),
          AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: resendTimeoutCounter <= 0
                ? TextButton(
                    onPressed: () async {
                      await _sendSmsVerificationCode(
                        forceResendingToken: this.forceResendingToken,
                        onCodeSent: () {
                          setState(() {
                            this.resetTimer();
                            this.startTimer();

                            Utils.alert(
                              context,
                              'Kode verifikasi berhasil dikirim ulang.',
                            );
                          });
                        },
                      );
                    },
                    style: TextButton.styleFrom(
                      primary: ColorPallete.primaryColor,
                    ),
                    child: Text('Kirim ulang kode verifikasi'),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                      right: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: Text(
                      'Kirim ulang kode dalam 0:${resendTimeoutCounter}',
                      style: kTextTheme.overline,
                    ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                Container(
                  decoration: BoxDecoration(
                    border: kBorderedDecoration.border,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    Icons.person_rounded,
                    color: ColorPallete.primaryColor,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Pengguna Baru',
                  style: kTextTheme.headline1,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Silahkan masukan nama lengkap Anda sesuai KTP.',
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
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
                          controller: userNameCodeField,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          validator: ValidationHelper.validateName,
                          decoration:
                              InputDecoration.collapsed(hintText: 'Nama Anda'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14),
              ],
            ),
          ),
          SizedBox(
            width: 120,
            height: 48,
            child: PrimaryButton(
              disabled: userNameCodeField.text.isEmpty,
              onPressed: () async {
                FocusScope.of(context).unfocus();

                if (!userNameFormKey.currentState!.validate()) return;

                final name = userNameCodeField.text;

                setState(() {
                  isLoading = true;
                });

                await context.read(authProvider.notifier).updateUserName(name);
              },
              child: Text('Masuk'),
            ),
          ),
          SizedBox(height: 38),
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

  Future<void> _sendSmsVerificationCode(
      {int? forceResendingToken, Function? onCodeSent}) {
    setState(() {
      isLoading = true;
    });

    return context.read(firebaseAuthProvider).verifyPhoneNumber(
          phoneNumber: "+62 ${phoneNumberField.text}",
          forceResendingToken: forceResendingToken,
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
              this.startTimer();
            });

            onCodeSent?.call();
          },
          codeAutoRetrievalTimeout: (verificationId) {
            // print('timeout');
            // print(verificationId);
          },
        );
  }

  void _cancelConfirmingOtp() {
    setState(() {
      curentState = MobileVerificationState.SHOW_PHONE_FORM;
      isLoading = false;
      this.verificationId = null;
      this.forceResendingToken = null;
      this.resetTimer();
    });
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
    resendTimer?.cancel();
    phoneNumberField.dispose();
    otpCodeField.dispose();
    userNameCodeField.dispose();

    super.dispose();
  }
}

class DiiketLogo extends StatelessWidget {
  const DiiketLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Entry.all(
      child: Container(
        decoration: BoxDecoration(
          border: kBorderedDecoration.border,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(22),
        child: Image.asset(
          'assets/images/splash.png',
          width: 23,
          height: 23,
        ),
      ),
    );
  }
}
