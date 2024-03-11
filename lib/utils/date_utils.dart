import 'package:intl/intl.dart';

class MyDateUtils {
  static String getFormattedDate(DateTime dateTime) {
    final format = DateFormat('MMMM dd, yyyy');
    return format.format(dateTime);
  }
}
