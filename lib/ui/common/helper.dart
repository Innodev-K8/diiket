import 'package:intl/intl.dart';

abstract class Helper {
  static NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: '',
    decimalDigits: 0,
  );

  static String greeting() {
    var hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Selamat Pagi';
    }

    if (hour < 17) {
      return 'Selamat Siang';
    }

    return 'Selamat Malam';
  }

  static String fmtPrice([int? price = 0]) {
    return currencyFormatter.format(price);
  }
}
