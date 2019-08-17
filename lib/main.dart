import 'package:bill_spliter/ui/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bill Spliter",
      theme: ThemeData(backgroundColor: Color(0xffe7e9f0), fontFamily: 'Raleway'),
      home: Home(),
    );
  }
}