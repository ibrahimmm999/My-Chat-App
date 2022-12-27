import 'package:intl/intl.dart';

class AppFormat {
  static String infoNumber(double number) {
    return NumberFormat.compact().format(number);
  }

  static String fullDateTime(String date) {
    return DateFormat('EEEE, d MM yy | HH:mm').format(DateTime.parse(date));
  }

  static String publish(String date) {
    DateTime dateToDateTime = DateTime.parse(date);
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(const Duration(days: 1));
    if (dateToDateTime.isBefore(yesterday)) {
      return fullDateTime(date);
    } else {
      int hour = now.difference(dateToDateTime).inHours;
      if (hour >= 1) {
        return '$hour hour';
      } else {
        int minute = now.difference(dateToDateTime).inMinutes;
        if (minute >= 1) {
          return '$minute minute';
        } else {
          int sec = now.difference(dateToDateTime).inSeconds;
          sec = sec < 0 ? 1 : sec;
          return '$sec second';
        }
      }
    }
  }
}
