import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:witw/services/geo.dart';
import 'dart:math' as math;
import 'package:witw/services/animated-transform.dart';

class RotationExample extends StatefulWidget {
  final Widget child;

  const RotationExample({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  RotationExampleState createState() {
    return new RotationExampleState();
  }
}

class RotationExampleState extends State<RotationExample> {
  final _random = math.Random();
  double rad = 0.0;

  @override
  void initState() {
    super.initState();

    FlutterCompass.events.listen((double direction) {
      setState(() {
        rad = degreesToRadians(direction - 180);
      });
      //getBearing(-33.344921, 18.161560, 51.5007292, -0.1246254);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _rotate,
      child: AnimatedTransform(
        duration: const Duration(seconds: 1),
        alignment: Alignment.center,
        transform: Matrix4.rotationZ(rad),
        child: new Image.asset('assets/cp-red.png'),
      ),
    );
  }

  void _rotate() {
    setState(() {
      rad = math.pi * 2 / 25 * _random.nextInt(25);
    });
  }
}
