extension DateTimeExtension on DateTime {

  DateTime get dateOnly => DateTime(year, month, day);

  String dateOnlyString(){
    String monthS = month > 9 ? '$month' : '0$month';
    return '$day-$monthS-$year';
  }
}