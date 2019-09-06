import 'dart:async';

import 'package:bill_spliter/core/controller.dart';
import 'package:bill_spliter/ui/slider/friendView.dart';
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
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade100,
              boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(57, 153, 66, 0.5),
                offset: Offset(0.0, 20.0),
                blurRadius: 20.0
              )
            ], 
            ),
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
    // make loop to create these based on number of friends
    return Column(
      //children: <Widget>[
      //  FriendView("FRIEND A", Colors.transparent, "\$21"),
      //  FriendView("FRIEND B", Colors.transparent, "\$21"),
      //  FriendView("FRIEND C", Colors.transparent, "\$21"),
      //  FriendView("FRIEND D", Colors.transparent, "\$21"),
      //],
      children: _getSplits(int.parse(widget.logicController.friendsString))
    );
  }

  List<Widget> _getSplits(int number)
  {
    List<Widget> splits = List<Widget>();
    for(var i = 0; i < number; i++)
    {
      if(i <  number-1) {
        splits.add(FriendView("FRIEND ${i+1}", Colors.transparent, widget.logicController.individualPrices[i].toString(), false));
      } else {
        splits.add(FriendView("FRIEND ${i+1}", Colors.transparent, widget.logicController.individualPrices[i].toString(), true));
      }
    }
    return splits;
  }

  @override
  void dispose() {
    controllerClose.dispose();
    controller.dispose();
    super.dispose();
  }
}