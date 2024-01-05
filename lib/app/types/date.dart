import 'package:intl/intl.dart';

extension StringExtension on String {
  String toDateFormat() {
    DateTime parsedDate = DateTime.parse(this);
    return DateFormat('dd / MMMM / y').format(parsedDate);
  }
}
