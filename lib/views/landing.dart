import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:witw/views/selection.dart';

class LandingView extends StatefulWidget {
  @override
  LandingViewState createState() => new LandingViewState();
}

class LandingViewState extends State<LandingView> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Create logo
    Widget logoSection = GestureDetector(
      onTap: () {
        setState(() {
          _visible = false;
        });

        Future.delayed(const Duration(milliseconds: 1000), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SelectionView()),
          );
        });
      },
      child: AnimatedOpacity(
          // If the Widget should be visible, animate to 1.0 (fully visible). If
          // the Widget should be hidden, animate to 0.0 (invisible).
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          // The green box needs to be the child of the AnimatedOpacity
          child: Image.asset(
            'assets/img/cp-red.png',
            width: 200.0,
            height: 200.0,
          )),
    );

    // Create title widget
    Widget titleSection = AnimatedOpacity(
        // If the Widget should be visible, animate to 1.0 (fully visible). If
        // the Widget should be hidden, animate to 0.0 (invisible).
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 500),
        // The green box needs to be the child of the AnimatedOpacity
        child: Container(
            child: Text('...where in the world?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900))));

    return new Material(
        child: Container(
            alignment: Alignment(0.0, 0.0),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[logoSection, titleSection],
            )));
  }
}
