// can make seperate file for extensions as well

extension StringExtension on String {
  String get capitalize =>
      isNotEmpty ? this[0].toUpperCase() + substring(1) : this;
}

class Utils {
  /// Used to convert List<String> to a String
  static String listToString(List<String> stringList) {
    return stringList.toString().replaceAll("[", "").replaceAll("]", "");
  }
}
