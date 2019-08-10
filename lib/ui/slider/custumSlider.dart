import 'package:flutter/material.dart';

class CustomSliderImplementation extends StatefulWidget {
  @override
  _CustomSliderImplementationState createState() => _CustomSliderImplementationState();
}

class _CustomSliderImplementationState extends State<CustomSliderImplementation> {
  Color positiveColor = new Color(0xFFEF0078);
  Color negetiveColor = new Color(0xFFFFFFFF);
  double percentage  = 0.0;

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
      ),
    );
  }
}

class CustomSlider extends StatelessWidget {
  double totalWidth = 200.0;
  double percentage;
  Color positiveColor;
  Color negetiveColor;

  CustomSlider({
    this.percentage,
    this.positiveColor,
    this.negetiveColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: totalWidth + 4.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: negetiveColor,
        border: Border.all(
          color: Colors.black,
          width: 2.0
        )
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            color: positiveColor,
            width: (percentage/100)*totalWidth,
          ),
        ],
      ),
    );
  }

}