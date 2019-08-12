class Controller {

  String totalString;
  String billString;
  String friendsString;
  String tipsString;
  String tipsLabel;

  double _total;
  double _bill;
  double _tips;

  Controller() {
    totalString = "\$";
    billString = "\$";
    friendsString = "0";
    tipsString = "\$0.00";
    tipsLabel = "TIP (0%)";
    _total = 0;
    _bill = 0;
    _tips = 0;
  }

  void updateFriends(int numFriends)
  {
    friendsString = numFriends.toString();
  }

  void updateTipPercent(int percent) {
    _tips = _bill * (percent * 0.01);
    tipsString = "\$" + _tips.toStringAsFixed(2);
    tipsLabel = "TIP (" + percent.toString() + "%)";
    updateTotal();
  }

  void updateBillKeyPress(String key) {
    billString = billString + key;
    if(billString.length > 1) {
      String billWithoutSymbol = billString.substring(1, billString.length);
      //if (billWithoutSymbol.contains(".")) {
      //  bill = 
      //}
      _bill = double.parse(billWithoutSymbol);
    } else {
      _bill = 0;
    }
    updateTotal();
  }

  void updateTotal() {
    _total = _bill + _tips;
    totalString = "\$" + _total.toStringAsFixed(2);
  }

  void backKeyPress() {
    _bill = 0;
    billString = "\$";
    _total = 0;
    totalString = "\$";
  }
}