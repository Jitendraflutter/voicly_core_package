class UtilsMethod {
  static String formatDurationFromSeconds(num totalSeconds) {
    if (totalSeconds <= 0) return "0m";

    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;

    if (hours > 0) {
      return "${hours}h ${minutes}m";
    } else {
      return "${minutes}m";
    }
  }
}
