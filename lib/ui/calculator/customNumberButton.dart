import 'package:flutter/material.dart';

class CustomNumberButton extends StatelessWidget {
  CustomNumberButton(this.number, this.backButton);

  final String number;
  final bool backButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 60,
      color: Colors.transparent,
      child: Center(
        child: (backButton)? _iconView(context) : _textView(context)
      ),
    );
  }

  Widget _textView(BuildContext context) {
    return Text(
          number,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 25
          ),
        );
  }

  Widget _iconView(BuildContext context){
    return Icon(
      Icons.backspace,
      color: Colors.red,
    );
  }
}