import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:witw/views/compass.dart';

class LandingView extends StatelessWidget {
  LandingView({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    // Create title widget
    Widget titleSection = Container(
        child: Text('...where in the world?',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 30.0,
                fontWeight: FontWeight.w900)));

    // Create buttons
    Widget button = RaisedButton(
      color: Colors.white,
      child: Text('Start'),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RotationExample()),
        );
      },
    );

    return new Material(
        child: Container(
            alignment: Alignment(0.0, 0.0),
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/cp-red.png',
                  width: 200.0,
                  height: 200.0,
                ),
                titleSection,
                button
              ],
            )));
  }
}
