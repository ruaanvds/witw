import 'package:flutter/material.dart';
import 'package:witw/views/landing.dart';

void main() => runApp(WITWApp());

class WITWApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Animation Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LandingView(title: "Animation Main Page"),
    );
  }
}