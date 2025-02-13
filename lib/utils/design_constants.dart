import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  /// Returns date in `yyyy-MM-dd` format (e.g., 2025-02-13)
  String get getDefaultDateFormat => DateFormat('yyyy-MM-dd').format(this);

  /// Returns date and time in `yyyy-MM-dd hh:mm a` format (e.g., 2025-02-13 09:30 AM)
  String get getDefaultDateTimeFormat => DateFormat('yyyy-MM-dd').add_jm().format(this);
}
