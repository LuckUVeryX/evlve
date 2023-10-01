extension DateTimeX on DateTime {
  DateTime stripTime() => DateTime(year, month, day);
  DateTime upcomingSat() {
    return DateTime(year, month, day - weekday % 7 + DateTime.saturday);
  }
}
