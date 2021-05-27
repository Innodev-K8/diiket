abstract class Helper {
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
}
