import 'package:bill_spliter/core/controller.dart';
import 'package:flutter/material.dart';

/**
 * Make this a max of people for simplicity with spilts
 */

class CustomSliderImplementation extends StatefulWidget {
  CustomSliderImplementation({Key key, @required this.notifyParent, @required this.logicController}) : super(key: key);

  final Function notifyParent;
  final Controller logicController;
  
  @override
  _CustomSliderImplementationState createState() => _CustomSliderImplementationState();
}

class _CustomSliderImplementationState extends State<CustomSliderImplementation> {
  Color positiveColor = Color.fromRGBO(57, 153, 66, 1);
  Color negetiveColor = Colors.grey.shade300;
  double percentage  = 50.0;
  
  double modDivisor = 5;

  double initial = 0.0;

  double tempPos;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (DragStartDetails details) {
        initial = details.globalPosition.dx;
        tempPos = details.globalPosition.dx;
      },
      onPanUpdate: (DragUpdateDetails details) {
        if(tempPos > details.globalPosition.dx) {
          print("Moving left");
        } else if (tempPos < details.globalPosition.dx) {
          print("Moving right");
        }


        double distance = details.globalPosition.dx - initial;
        double percentageAddition = distance / MediaQuery.of(context).size.width; //200
        setState(() {
          percentage = (percentage + percentageAddition).clamp(0.0, 100.0);
          int temp = (percentage/10).round();
          int num = 0;
          if(temp <= 2) {
            num = 1;
          } else if (temp > 2 && temp <= 4) {
            num = 2;
          } else if (temp > 4 && temp <= 6) {
            num = 3;
          } else if (temp > 6 && temp <= 8) {
            num = 4;
          } else {
            num = 5;
          }
          //widget.logicController.updateFriends((percentage/10).round());
          widget.logicController.updateFriends(num);
          widget.notifyParent();
        });
      },
      onPanEnd: (DragEndDetails details)  {
        initial = 0.0;
      },
      child: CustomSlider(
        percentage: this.percentage,
        positiveColor: positiveColor,
        negetiveColor: negetiveColor,
        totalWidth: MediaQuery.of(context).size.width - 50,
      ),
    );
  }
}

class CustomSlider extends StatelessWidget {
  double totalWidth;
  double percentage;
  Color positiveColor;
  Color negetiveColor;

  CustomSlider({
    this.totalWidth,
    this.percentage,
    this.positiveColor,
    this.negetiveColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: totalWidth + 4.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: negetiveColor,
        //border: Border.all(
        //  color: Colors.black,
        //  width: 2.0
        //)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                //height: 30,
                color: positiveColor,
                width: (percentage/100)*totalWidth,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    color: Colors.red,
                    width: 10.0,
                    height: 60,
                  ),
                ),
              ),
              Container(
                width: totalWidth+4,
                child: Row(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: Icon(Icons.people_outline, color: Colors.white,),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB((totalWidth - 40), 5, 10, 5),
                            child: Text(
                              (percentage/10).toStringAsFixed(0),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0
                              ), 
                            ),
                          ),
                        )
                      ],
                    )
                    
                    
                  ],
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }

}