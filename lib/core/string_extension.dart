extension StringExtension on String {
  String titleCase() {
    var listParams = toLowerCase().split(" ");
    String result = "";
    for (var value in listParams) {
      if (value != "") {
        result += "${value[0].toUpperCase()}${value.substring(1)}";
      }
    }
    return result;
  }
}
