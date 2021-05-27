class ValidationHelper {
  static String? validateName(String? value) {
    if (value == null || value.length == 0) {
      return 'Harap masukan nama Anda';
    }

    return null;
  }

  static String? validateMobile(String? value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);

    if (value == null || value.length == 0) {
      return 'Harap masukan nomor telepon Anda';
    } else if (!regExp.hasMatch(value)) {
      return 'Harap untuk memasukan nomor telepon yang valid';
    }

    return null;
  }
}
