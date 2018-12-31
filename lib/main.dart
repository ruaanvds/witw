import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:witw/views/landing.dart';

void main() => runApp(WITWApp());

class WITWApp extends StatefulWidget {
  @override
  _WITWAppState createState() => new _WITWAppState();
}

class _WITWAppState extends State<WITWApp> {
  Location _location = new Location();
  bool _permission = false;
  String error;
  bool currentWidget = true;

  @override
  void initState() {
    super.initState();
    getGeoLocation();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  getGeoLocation() async {
    Map<String, double> location;

    try {
      final prefs = await SharedPreferences.getInstance();
      _permission = await _location.hasPermission();
      location = await _location.getLocation();

      prefs.setDouble('cLat', location['latitude']);
      prefs.setDouble('cLon', location['longitude']);

      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error =
            'Permission denied - please ask the user to enable it from the app settings';
      }

      location = null;
    }
  }

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
