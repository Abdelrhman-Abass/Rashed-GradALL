import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

enum DateFormatType {
  fullDayShortMonth, // For "Tuesday, Mar 3, 2024"
  fullMonth,         // For "March 3, 2024"
  month         // For "March, 2024"
}

extension DateTimeExtension on DateTime {
  /// Return a string representing [date] formatted according to our locale
  String format({
    DateFormatType pattern = DateFormatType.fullDayShortMonth,
    String? format,
    String locale = 'en',
  }) {
    initializeDateFormatting(locale);

    if(format != null) return DateFormat(format, locale).format(this);

    switch (pattern) {
      case DateFormatType.fullDayShortMonth:
        return DateFormat('EEEE, MMM d, yyyy', locale).format(this); // "Tuesday, Mar 3, 2024"
      case DateFormatType.fullMonth:
        return DateFormat('MMMM d, yyyy', locale).format(this);      // "March 3, 2024"
      case DateFormatType.month:
        return DateFormat('MMMM, yyyy', locale).format(this);      // "March, 2024"
    }
  }
}
