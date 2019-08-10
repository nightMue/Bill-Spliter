import 'package:flutter/material.dart';

class CustomPercentButton extends StatefulWidget {
  CustomPercentButton(this.percent);

  final String percent;

  @override
  _CustomPercentButtonState createState() => _CustomPercentButtonState(percent);
}

class _CustomPercentButtonState extends State<CustomPercentButton> {
  final String percent;
  bool checked;

  _CustomPercentButtonState(this.percent);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)
        ),
        height: 50,
        width: 75,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 20,
                width: 20,
                child: (checked)? Icon(Icons.check, color: Colors.green, size: 15,): Icon(Icons.check, color: Colors.grey, size: 15),
              ),
            ),
            Center(
              child: Text(percent),
            )
          ],
        )
    );
  }
}
