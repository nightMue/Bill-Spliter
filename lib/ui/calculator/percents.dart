import 'package:bill_spliter/core/controller.dart';
import 'package:flutter/material.dart';

class PercentButtons extends StatefulWidget {
  PercentButtons({Key key, @required this.notifyParent, @required this.logicController}) : super(key: key);

  final Controller logicController;
  final Function() notifyParent;

  @override
  _PercentButtonsState createState() => _PercentButtonsState();
}

class _PercentButtonsState extends State<PercentButtons> {
  _selectZero() {
    widget.logicController.updateTipPercent(0);
    setState(() {
      _zero = true;
      _ten = false;
      _twenty = false;
      _thirdy = false;
    });
    widget.notifyParent();
  }

  _selectTen() {
    widget.logicController.updateTipPercent(10);
    setState(() {
      _zero = false;
      _ten = true;
      _twenty = false;
      _thirdy = false;
    });
    widget.notifyParent();
  }

  _selectTwenty() {
    widget.logicController.updateTipPercent(20);
    setState(() {
      _zero = false;
      _ten = false;
      _twenty = true;
      _thirdy = false;
    });
    widget.notifyParent();
  }

  _selectThirdy() {
    widget.logicController.updateTipPercent(30);
    setState(() {
      _zero = false;
      _ten = false;
      _twenty = false;
      _thirdy = true;
    });
    widget.notifyParent();
  }

  bool _zero;
  bool _ten;
  bool _twenty;
  bool _thirdy;

  @override
  void initState() {
    _zero = true;
    _ten = false;
    _twenty = false;
    _thirdy = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () => _selectZero(),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: (_zero)? Colors.green : Colors.grey,
                      width: (_zero)? 2.0 : 1.0,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                height: 50,
                width: 75,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.check,
                          color: (_zero)? Colors.green : Colors.grey,
                          size: 15,
                        ),
                      ),
                    ),
                    Center(
                      child: Text("0%"),
                    )
                  ],
                )),
          ),
          GestureDetector(
            onTap: () => _selectTen(),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: (_ten)? Colors.green : Colors.grey,
                      width: (_ten)? 2.0 : 1.0
                    ),
                    borderRadius: BorderRadius.circular(5)),
                height: 50,
                width: 75,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.check,
                          color: (_ten)? Colors.green : Colors.grey,
                          size: 15,
                        ),
                      ),
                    ),
                    Center(
                      child: Text("10%"),
                    )
                  ],
                )),
          ),
          GestureDetector(
            onTap: () => _selectTwenty(),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: (_twenty)? Colors.green : Colors.grey,
                      width: (_twenty)? 2.0 : 1.0
                    ),
                    borderRadius: BorderRadius.circular(5)),
                height: 50,
                width: 75,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.check,
                          color: (_twenty)? Colors.green : Colors.grey,
                          size: 15,
                        ),
                      ),
                    ),
                    Center(
                      child: Text("20%"),
                    )
                  ],
                )),
          ),
          GestureDetector(
            onTap: () => _selectThirdy(),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: (_thirdy)? Colors.green : Colors.grey,
                      width: (_thirdy)? 2.0 : 1.0
                    ),
                    borderRadius: BorderRadius.circular(5)),
                height: 50,
                width: 75,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.check,
                          color: (_thirdy)? Colors.green : Colors.grey,
                          size: 15,
                        ),
                      ),
                    ),
                    Center(
                      child: Text("30%"),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
