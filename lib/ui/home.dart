import 'package:bill_spliter/core/controller.dart';
import 'package:bill_spliter/ui/bottomButton.dart';
import 'package:bill_spliter/ui/calculator.dart';
import 'package:bill_spliter/ui/topBar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Controller logicController = Controller();

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          titleSpacing: 0.0,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Text(
              "Split Bill",
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          centerTitle: false,
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
          
        ),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TopBar(logicController),
          Expanded(
            child: Calculator(notifyParent: refresh, logicController: logicController,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BottomButton(),
            ),
          )
          ],
        )
      /*body: Stack(
        children: <Widget>[
          TopBar(),
          Container(
            height: 300,
            child: Center(child:Text("Content")),
            color: Colors.blue,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            //color: Colors.yellow,
            child: BottomButton(),
          )
        ],
      ),*/
    );
  }
}