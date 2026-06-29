import 'package:intl/intl.dart';

/// Date and time formatting helpers.
abstract final class AppDateUtils {
  static String getGreeting(DateTime dateTime) {
    final hour = dateTime.hour;
    return switch (hour) {
      < 12 => 'Good Morning',
      < 17 => 'Good Afternoon',
      _ => 'Good Evening',
    };
  }

  static String formatFullDate(DateTime date) {
    return DateFormat('EEEE, d MMMM yyyy').format(date);
  }

  static String formatShortDate(DateTime date) {
    return DateFormat('d MMM').format(date);
  }
}
