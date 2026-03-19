import 'package:intl/intl.dart';

extension DatetimeExtension on DateTime? {
  String? get expiryFormat {
    if (this == null) return null;
    return DateFormat("MM/yyyy").format(this!);
  }

  String? get fullFormat {
    if (this == null) return null;
    return DateFormat("EEE dd.MM.yyyy").format(this!);
  }
}
