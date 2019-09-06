import 'package:auto_size_text/auto_size_text.dart';
import 'package:bill_spliter/core/controller.dart';
import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  TopBar(this.logicController);

  final Controller logicController;

  @override
  _TopBarState createState() => _TopBarState(logicController);
}
/// Need to update on load
class _TopBarState extends State<TopBar> {
  _TopBarState(this.logicController);

  Controller logicController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 125,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(57, 153, 66, 0.5),
                offset: Offset(0.0, 20.0),
                blurRadius: 20.0
              )
            ],
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color.fromRGBO(57, 153, 66, 1),
                Color.fromRGBO(57, 153, 66, 1)
              ]
            ),
            //color: Colors.green,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(30, 30, 0, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "TOTAL",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0
                      ),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 2),
                      child: AutoSizeText(
                        logicController.totalString,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0
                        ),
                        //maxFontSize: 40.0,
                        maxLines: 1,
                      ),
                    ),
                    //Text(
                      //total,
                    //  logicController.totalString,
                    //  style: TextStyle(
                    //    color: Colors.white,
                    //    fontWeight: FontWeight.bold,
                    //    fontSize: 40.0
                    //  ),
                    //)
                  ],
                ),
              ),
              Container(
                //color: Colors.yellow,
                width: 150,
                padding: EdgeInsets.fromLTRB(0, 30, 30, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "BILL",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Text(
                          logicController.billString,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "FRIENDS",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600
                          ),
                        ),   
                        Text(
                          logicController.friendsString,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          logicController.tipsLabel,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Text(
                          //tips,
                          logicController.tipsString,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ),
        
      ),
    );
  }
}