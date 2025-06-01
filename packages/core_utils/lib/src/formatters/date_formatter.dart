import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(DateTime date, {String pattern = 'dd/MM/yyyy'}) {
    return DateFormat(pattern).format(date);
  }

  static String formatTime(DateTime date, {String pattern = 'HH:mm'}) {
    return DateFormat(pattern).format(date);
  }
}