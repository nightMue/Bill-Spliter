import 'package:flutter/material.dart';

class FriendView extends StatefulWidget {
  @override
  _FriendViewState createState() => _FriendViewState();
}

class _FriendViewState extends State<FriendView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("FRIEND DRAG"),
      child: Container(
        
      ),
    );
  }
}