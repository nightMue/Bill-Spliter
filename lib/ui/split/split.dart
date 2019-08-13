import 'dart:async';

import 'package:bill_spliter/core/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class SplitView extends StatefulWidget {
  SplitView({Key key, @required this.notifyParent, @required this.logicController}) : super(key: key);

  final Function notifyParent;
  final Controller logicController;
  
  @override
  _SplitViewState createState() => _SplitViewState();
}

class _SplitViewState extends State<SplitView> with TickerProviderStateMixin {
  Animation<double> animation;
  Animation<double> animationClose;
  AnimationController controllerClose;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this
    );
    animation = Tween<double>(begin: 0, end: 475).animate(controller)
      ..addListener(() {
        setState(() {
          //print(animation.value);
        });
      });
    controller.forward();

    controllerClose = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this
    );
    animationClose = Tween<double>(begin: 475, end: 0).animate(controllerClose)
      ..addListener(() {
        print(animation.value);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.transparent,
            height: animation.value,
            child:Visibility(
              visible: (widget.logicController.displayReady) ? true : false,
              child: FutureBuilder(
                future: Future.delayed(Duration(milliseconds: 1)),
                builder: (c, s) => s.connectionState == ConnectionState.done
                  ? Center( child: _splitView(context))
                  : Center( child: Text(""))
              ),
            ),
          )
        ],
      )
    );
  }

  Widget _splitView(BuildContext context)
  {
    return Column(
      children: <Widget>[
        Center(child: Text("ITEM"),),
        Center(child: Text("ITEM"),),
        Center(child: Text("ITEM"),),
        Center(child: Text("ITEM"),),
        Center(child: Text("ITEM"),),
      ],
    );
  }

  @override
  void dispose() {
    controllerClose.dispose();
    controller.dispose();
    super.dispose();
  }
}