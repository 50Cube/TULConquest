import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tul_conquest/main.dart';

bool wibracje = true;

_save() async {
  final prefs = await SharedPreferences.getInstance();
  final wib = 'vibration';
  prefs.setBool(wib, wibracje);
}

class SettingsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Ustawienia"), backgroundColor: Colors.indigo[800]),
      body: Center(
          child: Container(
              width: szerokoscOkna * 0.85,
              padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: ListView(children: <Widget>[
                Align (
                  alignment: Alignment.topCenter,
                  child: Container (
                    height: wysokoscOkna * 0.1,
                    width: szerokoscOkna * 0.9,
                    child: Text(''
                        'Przeciągnij, aby wyłączyć lub włączyć wibracje.',
                        style: TextStyle(
                          fontSize: 18
                        ),
                    ),
                  )
                ),
                SwitchListTile(
                  value: wibracje,
                  title: Text("Wibracje",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  onChanged: (bool value) {
                   // setState(() {
                      wibracje = value;
                      _save();
                    //}
                  },
                  secondary: const Icon(Icons.vibration),
                ),
              ]))),
    );
  }
}
