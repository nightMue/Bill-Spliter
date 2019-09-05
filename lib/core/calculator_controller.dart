import 'package:bill_spliter/core/controller.dart';

class CalculatorController {
  Controller mainAppController;
  
  bool decimalUsed; 
  final int _maxCharCount = 9;
  final int _maxPercision = 2;
  int _currentPercision;
  int _currentCharCount;

  CalculatorController(Controller mainController)
  {
    mainAppController = mainController;
    decimalUsed = false;
    _currentCharCount = 0;
    _currentPercision = 0;
  }

  void backKeyPress() {
    mainAppController.resetForm();
    decimalUsed = false;
    _currentCharCount = 0;
    _currentPercision = 0;
  }

  bool decimalKeyPress()
  {
    if(!decimalUsed && (_currentCharCount < (_maxCharCount - 2)))
    {
      mainAppController.updateBillKeyPress(".");
      decimalUsed = true;
      _currentCharCount += 1;
      return true;
    }
    return false;
  }

  void updateBillKeyPress(int number)
  {
    if(_currentCharCount < _maxCharCount)
    {
      if(decimalUsed)
      {
        if(_currentPercision < _maxPercision)
        {
          _currentCharCount += 1;
          mainAppController.updateBillKeyPress(number.toString());
          _currentPercision += 1;
        }
      }
      else  
      {
        _currentCharCount += 1;
        mainAppController.updateBillKeyPress(number.toString());
      }
    }
  }
}