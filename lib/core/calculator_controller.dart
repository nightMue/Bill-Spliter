import 'package:bill_spliter/core/controller.dart';

class CalculatorController {
  Controller mainAppController;
  
  bool decimalUsed;

  CalculatorController(Controller mainController)
  {
    mainAppController = mainController;
    decimalUsed = false;
  }

  void backKeyPress() {
    mainAppController.resetForm();
    decimalUsed = false;
  }

  bool decimalKeyPress()
  {
    if(!decimalUsed)
    {
      mainAppController.updateBillKeyPress(".");
      decimalUsed = true;
      return true;
    }
    return false;
  }

  void updateBillKeyPress(int number)
  {
    mainAppController.updateBillKeyPress(number.toString());
  }
}