import 'package:bill_spliter/core/calculator_controller.dart';
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

  _CalculatorState(Controller logicController) {
    this.calculatorController = CalculatorController(logicController);
  }

  CalculatorController calculatorController;

  //bool canVibrate = await Vibrate.canVibrate;

  refresh() {
    widget.notifyParent();
    setState(() {});
  }

  pressed(int number)
  {
    Vibrate.feedback(FeedbackType.light);
    calculatorController.updateBillKeyPress(number);
    widget.notifyParent();
  }

  _pressedDecimal() 
  {
    if(calculatorController.decimalKeyPress())
    {
      Vibrate.feedback(FeedbackType.light);
      widget.notifyParent();
    }
  }

  _pressedBack() 
  {
    Vibrate.feedback(FeedbackType.light);
    calculatorController.backKeyPress();
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
            CustomSliderImplementation(logicController: calculatorController.mainAppController, notifyParent: refresh),
            PercentButtons(logicController: calculatorController.mainAppController, notifyParent: refresh,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //GestureDetector(
                //  child: CustomNumberButton("1", false),
                //  onTap: () => pressed(1),
                //),
                Material(
                  color: Colors.transparent,
                  child:InkResponse(
                    radius: 30,
                    highlightShape: BoxShape.circle,
                    highlightColor: Colors.transparent,
                    splashColor: Color.fromRGBO(57, 153, 66, 0.5),
                    child: CustomNumberButton("1",  false),
                    onTap: () => pressed(1),
                  ),
                ),
                //GestureDetector(
                //  child: CustomNumberButton("2", false),
                //  onTap: () => pressed(2),
                //),
                Material(
                  color: Colors.transparent,
                  child:InkResponse(
                    radius: 30,
                    highlightShape: BoxShape.circle,
                    highlightColor: Colors.transparent,
                    splashColor: Color.fromRGBO(57, 153, 66, 0.5),
                    child: CustomNumberButton("2",  false),
                    onTap: () => pressed(2),
                  ),
                ),
                //GestureDetector(
                //  child: CustomNumberButton("3", false),
                //  onTap: () => pressed(3),
                //),
                Material(
                  color: Colors.transparent,
                  child:InkResponse(
                    radius: 30,
                    highlightShape: BoxShape.circle,
                    highlightColor: Colors.transparent,
                    splashColor: Color.fromRGBO(57, 153, 66, 0.5),
                    child: CustomNumberButton("3",  false),
                    onTap: () => pressed(3),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //GestureDetector(
                //  child: CustomNumberButton("4", false),
                //  onTap: () => pressed(4),
                //),
                Material(
                  color: Colors.transparent,
                  child:InkResponse(
                    radius: 30,
                    highlightShape: BoxShape.circle,
                    highlightColor: Colors.transparent,
                    splashColor: Color.fromRGBO(57, 153, 66, 0.5),
                    child: CustomNumberButton("4",  false),
                    onTap: () => pressed(4),
                  ),
                ),
                //GestureDetector(
                //  child: CustomNumberButton("5", false),
                //  onTap: () => pressed(5),
                //),
                Material(
                  color: Colors.transparent,
                  child:InkResponse(
                    radius: 30,
                    highlightShape: BoxShape.circle,
                    highlightColor: Colors.transparent,
                    splashColor: Color.fromRGBO(57, 153, 66, 0.5),
                    child: CustomNumberButton("5",  false),
                    onTap: () => pressed(5),
                  ),
                ),
                //GestureDetector(
                //  child: CustomNumberButton("6", false),
                //  onTap: () => pressed(6),
                //),
                Material(
                  color: Colors.transparent,
                  child:InkResponse(
                    radius: 30,
                    highlightShape: BoxShape.circle,
                    highlightColor: Colors.transparent,
                    splashColor: Color.fromRGBO(57, 153, 66, 0.5),
                    child: CustomNumberButton("6",  false),
                    onTap: () => pressed(6),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //GestureDetector(
                //  child: CustomNumberButton("7", false),
                //  onTap: () => pressed(7),
                //),
                Material(
                  color: Colors.transparent,
                  child:InkResponse(
                    radius: 30,
                    highlightShape: BoxShape.circle,
                    highlightColor: Colors.transparent,
                    splashColor: Color.fromRGBO(57, 153, 66, 0.5),
                    child: CustomNumberButton("7",  false),
                    onTap: () => pressed(7),
                  ),
                ),
                //GestureDetector(
                //  child: CustomNumberButton("8", false),
                //  onTap: () => pressed(8),
                //),
                Material(
                  color: Colors.transparent,
                  child:InkResponse(
                    radius: 30,
                    highlightShape: BoxShape.circle,
                    highlightColor: Colors.transparent,
                    splashColor: Color.fromRGBO(57, 153, 66, 0.5),
                    child: CustomNumberButton("8",  false),
                    onTap: () => pressed(8),
                  ),
                ),
                //GestureDetector(
                //  child: CustomNumberButton("9", false),
                //  onTap: () => pressed(9),
                //),
                Material(
                  color: Colors.transparent,
                  child:InkResponse(
                    radius: 30,
                    highlightShape: BoxShape.circle,
                    highlightColor: Colors.transparent,
                    splashColor: Color.fromRGBO(57, 153, 66, 0.5),
                    child: CustomNumberButton("9",  false),
                    onTap: () => pressed(9),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child:InkResponse(
                    radius: 30,
                    highlightShape: BoxShape.circle,
                    highlightColor: Colors.transparent,
                    splashColor: Color.fromRGBO(57, 153, 66, 0.5),
                    child: CustomNumberButton(".",  false),
                    onTap: () => _pressedDecimal(),
                  ),
                ),
                //GestureDetector(
                //  child: CustomNumberButton(".", false),
                //  onTap: () => _pressedDecimal(),
                //),
                Material(
                  color: Colors.transparent,
                  child:InkResponse(
                    radius: 30,
                    highlightShape: BoxShape.circle,
                    highlightColor: Colors.transparent,
                    splashColor: Color.fromRGBO(57, 153, 66, 0.5),
                    child: CustomNumberButton("0",  false),
                    onTap: () => pressed(0),
                  ),
                ),
                //GestureDetector(
                //  child: CustomNumberButton("0", false),
                //  onTap: () => pressed(0),
                //),
                Material(
                  color: Colors.transparent,
                  child:InkResponse(
                    radius: 30,
                    highlightShape: BoxShape.circle,
                    highlightColor: Colors.transparent,
                    splashColor: Color.fromRGBO(57, 153, 66, 0.5),
                    child: CustomNumberButton("->",  true),
                    onTap: () => print("BACK ONE"),
                    onLongPress: () => _pressedBack(),
                  ),
                ),
                //GestureDetector(
                //  child: CustomNumberButton("->", true),
                //  onLongPress: () => _pressedBack(),
                //  onTap: () => print("BACK ONE"),
                //),
              ],
            ),
            
          ],
        ),

      ),
    );
  }
}