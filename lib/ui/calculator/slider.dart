import 'package:flutter/material.dart';

class NumSlider extends StatefulWidget {
  @override
  _NumSliderState createState() => _NumSliderState();
}

class _NumSliderState extends State<NumSlider> {

  double _value = 0.0;

  onChanged(double value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Slider(
              value: _value,
              onChanged: onChanged,
            ),
          ),
          
        ] 
      ),
    );
  }
}
