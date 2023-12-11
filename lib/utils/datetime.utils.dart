import 'package:intl/intl.dart';

class DateTimeUtils {
  // Private constructor to prevent instantiation.
  DateTimeUtils._();

  // Convert a timestamp in seconds to a formatted date string including the day of the week.
  static String formatTimestampWithDayOfWeek(int timestamp) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    // EEEE: Full weekday name (e.g., "Wednesday").
    return DateFormat('EEEE').format(dateTime);
  }
}
