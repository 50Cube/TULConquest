import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'homescreen.dart';

bool wibracje = true;
bool dzwiek = false;

//class Settings extends StatefulWidget {
//  @override
//   createState() => HomeScreenState();
//}

class SettingsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Ustawienia"), backgroundColor: Colors.indigo[800]),
      body: Center(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: ListView(children: <Widget>[
                SwitchListTile(
                  value: wibracje,
                  title: Text("Wibracje",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  onChanged: (bool value) {
                   // setState(() {
                      wibracje = value;
                    //}
                  },
                  secondary: const Icon(Icons.vibration),
                ),
                Divider(),
                SwitchListTile(
                  value: dzwiek,
                  title: Text("Dźwięk",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),),
                  onChanged: (bool value) {
                    dzwiek = value;
                  },
                    secondary: const Icon(Icons.headset)
                ),
              ]))),
    );
  }
}
