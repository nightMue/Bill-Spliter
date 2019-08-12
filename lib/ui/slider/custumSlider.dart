import 'package:flutter/material.dart';

class CustomSliderImplementation extends StatefulWidget {
  @override
  _CustomSliderImplementationState createState() => _CustomSliderImplementationState();
}

class _CustomSliderImplementationState extends State<CustomSliderImplementation> {
  Color positiveColor = Color.fromRGBO(57, 153, 66, 1);
  Color negetiveColor = Colors.grey.shade300;
  double percentage  = 50.0;

  double initial = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (DragStartDetails details) {
        initial = details.globalPosition.dx;
      },
      onPanUpdate: (DragUpdateDetails details) {
        double distance = details.globalPosition.dx - initial;
        double percentageAddition = distance / 200;
        setState(() {
          percentage = (percentage + percentageAddition).clamp(0.0, 100.0);
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
                              percentage.toStringAsFixed(0),
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