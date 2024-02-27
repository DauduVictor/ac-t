/// String extension methods.
extension StringX on String {
  /// Add query parameters to end of string.
  String addQueryParams({required Map<String, Object?> queryParams}) {
    if (queryParams.isEmpty) return this;
    final buffer = StringBuffer('$this?');
    queryParams.forEach((key, value) {
      // Add non-null values to query.
      if (value != null) {
        if (value is List<String>) {
          for (final e in value) {
            buffer.write('$key=$e&');
          }
        } else {
          buffer.write('$key=$value&');
        }
      }
    });

    // Remove last character if '?' or '&'.
    final url = buffer.toString();
    final last = url[url.length - 1];
    if (last == '?' || last == '&') {
      return url.substring(0, url.length - 1);
    }
    return url;
  }

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
