import 'package:bill_spliter/core/controller.dart';
import 'package:bill_spliter/ui/calculator/customNumberButton.dart';
import 'package:bill_spliter/ui/calculator/percents.dart';
import 'package:bill_spliter/ui/slider/custumSlider.dart';
import 'package:flutter/material.dart';
import 'package:vibrate/vibrate.dart';

class Calculator extends StatefulWidget {
  Calculator({Key key, @required this.notifyParent, @required this.logicController}) : super(key: key);
  
  final Function() notifyParent;
  final Controller logicController;

  @override
  _CalculatorState createState() => _CalculatorState(logicController);
}

class _CalculatorState extends State<Calculator> {
  _CalculatorState(this.logicController);

  Controller logicController;

  //bool canVibrate = await Vibrate.canVibrate;

  refresh() {
    widget.notifyParent();
    setState(() {});
  }

  pressed(int number)
  {
    Vibrate.feedback(FeedbackType.light);
    logicController.updateBillKeyPress(number.toString());
    widget.notifyParent();
  }

  _pressedDecimal() 
  {
    if(!logicController.decimalUsed)
    {
      Vibrate.feedback(FeedbackType.light);
      logicController.updateBillKeyPress(".");
      widget.notifyParent();
      logicController.decimalUsed = true;
    }
  }

  _pressedBack() 
  {
    Vibrate.feedback(FeedbackType.light);
    logicController.backKeyPress();
    widget.notifyParent();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 30,),
            CustomSliderImplementation(logicController: logicController, notifyParent: refresh),
            PercentButtons(logicController: logicController, notifyParent: refresh,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  child: CustomNumberButton("1", false),
                  onTap: () => pressed(1),
                ),
                GestureDetector(
                  child: CustomNumberButton("2", false),
                  onTap: () => pressed(2),
                ),
                GestureDetector(
                  child: CustomNumberButton("3", false),
                  onTap: () => pressed(3),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  child: CustomNumberButton("4", false),
                  onTap: () => pressed(4),
                ),
                GestureDetector(
                  child: CustomNumberButton("5", false),
                  onTap: () => pressed(5),
                ),
                GestureDetector(
                  child: CustomNumberButton("6", false),
                  onTap: () => pressed(6),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  child: CustomNumberButton("7", false),
                  onTap: () => pressed(7),
                ),
                GestureDetector(
                  child: CustomNumberButton("8", false),
                  onTap: () => pressed(8),
                ),
                GestureDetector(
                  child: CustomNumberButton("9", false),
                  onTap: () => pressed(9),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  child: CustomNumberButton(".", false),
                  onTap: () => _pressedDecimal(),
                ),
                GestureDetector(
                  child: CustomNumberButton("0", false),
                  onTap: () => pressed(0),
                ),
                GestureDetector(
                  child: CustomNumberButton("->", true),
                  onTap: () => _pressedBack(),
                ),
              ],
            ),
            
          ],
        ),

      ),
    );
  }
}