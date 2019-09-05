import 'package:bill_spliter/utils/stringConverters.dart';

class Controller {

  bool _editing;
  bool displayReady;

  String totalString;
  String billString;
  String friendsString;
  String tipsString;
  String tipsLabel;

  double _total;
  double _bill;
  double _tips;
  double _sliderPercentage;

  List<double>individualPrices;

  int _tipPercent;

  Controller() {
    individualPrices = List<double>();
    totalString = "\$";
    billString = "\$";
    friendsString = "3";
    tipsString = "\$0.00";
    tipsLabel = "TIP (0%)";
    _total = 0;
    _bill = 0;
    _tips = 0;
    _editing = true;
    displayReady = true;
    _sliderPercentage = 50.0;
    _tipPercent = 0;
  }

  int getTipPercent()
  {
    return _tipPercent;
  }

  int getFriends()
  {
    return int.parse(friendsString);
  }

  double getSliderPercentage()
  {
    return _sliderPercentage;
  }

  void updateSliderPercentage(double newPercentage)
  {
    _sliderPercentage = newPercentage;
  }

  bool isEditing()
  {
    return _editing;
  }

  void toggleEditing()
  {
    _editing = !_editing;
    splitBillEvenly();
  }

  void updateFriends(int numFriends)
  {
    friendsString = numFriends.toString();
  }

  void updateTipPercent(int percent) {
    _tipPercent = percent;
    _tips = _bill * (percent * 0.01);
    //tipsString = "\$" + _tips.toStringAsFixed(2);
    tipsString = StringConverters.genTipsString(_tips);
    //tipsLabel = "TIP (" + percent.toString() + "%)";
    tipsLabel = StringConverters.genTipsLabel(percent);
    updateTotal();
  }

  void updateTip()
  {
    _tips = _bill * (_tipPercent * 0.01);
    tipsString = StringConverters.genTipsString(_tips);
    tipsLabel = StringConverters.genTipsLabel(_tipPercent);
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

  void resetForm() {
    _bill = 0;
    billString = "\$";
    _total = 0;
    totalString = "\$";
    _tips = 0;
    tipsString = "\$";
  }

  void updateTotal() {
    _total = _bill + _tips;
    //totalString = "\$" + _total.toStringAsFixed(2);
    totalString = StringConverters.genTotalString(_total);
    updateTip();
  }

  void splitBillEvenly() {
    individualPrices.clear();
    double evenSplit = double.parse((_total / int.parse(friendsString)).toStringAsFixed(2));
    if(ensureSplitCoversBill(evenSplit)) {
      addPricesToList(evenSplit);
    } else {
      while(ensureSplitCoversBill(evenSplit) == false)
      {
        // add 1 cent and check again
      evenSplit += 0.01;
      }
      addPricesToList(evenSplit);
    }
  }

  void addPricesToList(double price)
  {
    for(int i = 0; i < int.parse(friendsString); i++) {
      individualPrices.add(price);
    }
    //print(individualPrices);
  }

  bool ensureSplitCoversBill(double split){
    if(split * int.parse(friendsString) >= _total) {
      return true;
    }
    return false;
  }
}