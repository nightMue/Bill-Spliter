import 'package:flutter/material.dart';

class BottomButton extends StatefulWidget {
  @override
  _BottomButtonState createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  _editFunction() {
    setState(() {
      if(editing) {
        _paddingBottom = 0.0;
        _width = 80;
        _height = 30;
        _borderRadius = BorderRadius.only(
          topLeft: const Radius.circular(40.0),
          topRight: const Radius.circular(40.0)
        );
        editing = false;
      } else {
        _paddingBottom = 0.0;
        _width = MediaQuery.of(context).size.width - 20;
        _height = 50;
        _borderRadius = BorderRadius.only(
          topLeft: const Radius.circular(8.0),
          topRight: const Radius.circular(8.0)
        );
        //_borderRadius = BorderRadius.circular(8);
        editing = true;
      }
    });
  }

  bool editing;
  double _paddingBottom;
  double _width;
  double _height;
  BorderRadiusGeometry _borderRadius;

  @override
  void initState() {
    editing = true;
    _paddingBottom = 0.0;
    _height = 50;
    _borderRadius = BorderRadius.only(
      topLeft: const Radius.circular(8.0),
      topRight: const Radius.circular(8.0)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, _paddingBottom),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () => _editFunction(),
          child: AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: Color.fromRGBO(57, 153, 66, 1),
            ),
            width: (editing)? MediaQuery.of(context).size.width - 20 : _width,
            height: _height,
            child: Center(
              child: (editing)? _textView(context) : _iconView(context)
            ),
            duration: Duration(milliseconds: 800),
            curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
    );
  }

  Widget _iconView(BuildContext context) {
    return Icon(
      Icons.edit,
      color: Colors.white,
    );
  }

  Widget _textView(BuildContext context) {
    return Text(
      "SPLIT BILL",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 15
      ),
    );
  }
}