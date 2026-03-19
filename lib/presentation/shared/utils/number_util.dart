import 'package:intl/intl.dart';

class NumberUtil {
  static final currencyFormat = NumberFormat("#,##0.00", 'en_US');

  static String? formatNumber(dynamic number) {
    if (number == null) return null;
    return currencyFormat.format(number);
  }

  static String? formatCardNumber(String? number) {
    if (number == null) return null;
    final cardNo = number.substring(0, 4);
    return '$cardNo **** **** ****';
  }
}
