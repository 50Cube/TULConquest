import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'homescreen.dart';

bool wibracje = false;

class Settings extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class SettingsRoute extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Ustawienia"), backgroundColor: Colors.indigo[800]),
      body: Center(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: SwitchListTile(
                value: wibracje,
                title: Text("Wibracje",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                onChanged: (bool value) {
                  setState(() {
                    wibracje = value;
                  });
                },
              ))),
    );
  }
}
