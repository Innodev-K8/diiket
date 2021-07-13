class ValidationHelper {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Harap masukan nama Anda';
    }

    return null;
  }

  static String? validateMobile(String? value) {
    const String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    final RegExp regExp = RegExp(patttern);

    if (value == null || value.isEmpty) {
      return 'Harap masukan nomor telepon Anda';
    } else if (!regExp.hasMatch(value)) {
      return 'Nomor telepon tidak valid';
    }

    return null;
  }

  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return 'Harap masukan kode OTP';
    } else if (value.length != 6) {
      return 'Lengkapi kode OTP';
    }

    return null;
  }
}
