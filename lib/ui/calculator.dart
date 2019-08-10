import 'package:bill_spliter/core/controller.dart';
import 'package:bill_spliter/ui/calculator/customNumberButton.dart';
import 'package:bill_spliter/ui/calculator/percents.dart';
import 'package:flutter/material.dart';
import 'calculator/slider.dart';

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

  refresh() {
    widget.notifyParent();
    setState(() {});
  }

  pressed(int number)
  {
    logicController.updateBillKeyPress(number.toString());
    widget.notifyParent();
  }

  _pressedDecimal() 
  {
    logicController.updateBillKeyPress(".");
    widget.notifyParent();
  }

  _pressedBack() 
  {
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
            NumSlider(),
            //CustomSliderImplementation(),
            //SizedBox(height: 25,),
            PercentButtons(logicController: logicController, notifyParent: refresh,),
            //SizedBox(height: 25,),
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