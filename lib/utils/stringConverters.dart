class StringConverters {

  static String genTotalString(double total) {
    return "\$" + total.toStringAsFixed(2);
  }

  static String genTipsString(double tips) {
    return "\$" + tips.toStringAsFixed(2);
  }

  static String genTipsLabel(int percent) {
    return "TIP (" + percent.toString() + "%";
  }

}