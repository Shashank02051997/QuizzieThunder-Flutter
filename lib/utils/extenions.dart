extension StringExtension on String? {
  String orDefault() {
    return this?.isNotEmpty == true ? this! : "--";
  }
}
