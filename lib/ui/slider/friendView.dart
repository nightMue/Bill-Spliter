import 'package:flutter/material.dart';

class FriendView extends StatefulWidget {
  FriendView(this.index, this.color);

  final Color color;
  final String index;

  @override
  _FriendViewState createState() => _FriendViewState();
}

class _FriendViewState extends State<FriendView> {
  bool locked = false;

  _toggleLock() {
    setState(() {
      locked = !locked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          //padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
          color: widget.color,
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.index,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0),
                    ),
                    Text(
                      "\$21",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0),
                    )
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                      onTap: _toggleLock,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                color: Colors.grey.shade600,
                                height: 1.0,
                              ),
                            ),
                            Container(
                              decoration: (locked)?  null : BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  shape: BoxShape.circle),
                              color: (locked)
                                  ? Color.fromRGBO(57, 153, 66, 1)
                                  : null,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Icon(
                                  (locked) ? Icons.lock : Icons.drag_handle,
                                  color: (locked) ? Colors.white: Colors.black,
                                  size: 25.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      )))
            ],
          )),
    );
  }
}
