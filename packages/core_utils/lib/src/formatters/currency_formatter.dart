import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String format(double amount, {String locale = 'vi_VN', String symbol = '₫'}) {
    final format = NumberFormat.currency(locale: locale, symbol: symbol, decimalDigits: 0);
    return format.format(amount);
  }

  static String formatUSD(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }
}
