import 'package:bill_spliter/core/controller.dart';
import 'package:flutter/material.dart';
import 'package:vibrate/vibrate.dart';

class BottomButton extends StatefulWidget {
  BottomButton({Key key, @required this.notifyParent, @required this.logicController}) : super(key: key);

  final Function notifyParent;
  final Controller logicController;

  @override
  _BottomButtonState createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  _editFunction() {
    Vibrate.feedback(FeedbackType.medium);
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
        //_showToast(context);
        widget.logicController.toggleEditing();
        widget.notifyParent();
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
        widget.logicController.toggleEditing();
        widget.notifyParent();
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
            duration: Duration(milliseconds: 600),
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

  /**
  void _showToast(BuildContext context)
  {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text("Splitting bill...",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
        duration: Duration(milliseconds: 700),
        backgroundColor: Color.fromRGBO(57, 153, 66, 0.5),
      )
    );
  } */
}