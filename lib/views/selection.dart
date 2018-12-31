import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:witw/views/compass.dart';

class SelectionView extends StatelessWidget {
  SelectionView({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    Widget logo = Image.asset(
      'assets/img/cp-red.png',
      width: 100.0,
      height: 100.0,
    );

    // Create title widget
    Widget titleSection = Container(
        child: Text('Select game mode',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 30.0,
                fontWeight: FontWeight.w900)));

    // Create selection list
    Widget selectionList = Expanded(
        child: ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.location_city),
          title: Text('Major World Cities'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Compass()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.location_searching),
          title: Text('Local sites'),
        ),
      ],
    ));

    return new Material(
        child: Container(
            margin: const EdgeInsets.only(top: 55.0),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[logo, titleSection, selectionList],
            )));
  }
}
