import 'package:intl/intl.dart';

class DateFormatter {
  static const String _dateFormat = 'dd MMM yyyy';
  static String formatDate(DateTime date) {
    return DateFormat(_dateFormat).format(date);
  }
}
