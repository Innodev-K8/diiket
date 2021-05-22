import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:diiket/helpers/validation_helper.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

enum MobileVerificationState {
  SHOW_PHONE_FORM,
  SHOW_OTP_FORM,
}

class RegisterPage extends StatefulWidget {
  static final route = '/auth/register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  MobileVerificationState curentState = MobileVerificationState.SHOW_PHONE_FORM;

  final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  final phoneNumberField = TextEditingController();
  final otpCodeField = TextEditingController();

  bool isLoading = false;
  String? verificationId;
  int? forceResendingToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child:
                        curentState == MobileVerificationState.SHOW_PHONE_FORM
                            ? _buildMobileForm(context)
                            : _buildOtpForm(context),
                  ),
                ),
              ),
              if (isLoading) _buildLoading(),
            ],
          ),
        ),
      ),
    );
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
              inactiveFillColor: Colors.white,
              activeColor: ColorPallete.successColor,
              activeFillColor: Colors.white,
              selectedColor: ColorPallete.primaryColor,
              selectedFillColor: Colors.white,
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

    final phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: verificationId!,
      smsCode: otpCode,
    );

    await _signInWithPhoneCredential(phoneAuthCredential);
  }

  Future<void> _signInWithPhoneCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      isLoading = true;
    });

    try {
      context
          .read(authProvider.notifier)
          .signInWithPhoneCredential(phoneAuthCredential);
    } on CustomException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.message ?? 'Terjadi kesalahan',
          ),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    phoneNumberField.dispose();
    otpCodeField.dispose();

    super.dispose();
  }
}
