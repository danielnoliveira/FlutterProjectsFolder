class DateToStringConverter {
  static String converter(DateTime date) {
    var dateSplit = date.toString().split(" ");
    return dateSplit.first;
  }
}
