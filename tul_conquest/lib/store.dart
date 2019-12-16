import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tul_conquest/main.dart';
import 'package:tul_conquest/profilescreen.dart';

int cena = 5;

int tmp = 1;

class StoreRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sklep"), backgroundColor: Colors.indigo[800]),
      body: GestureDetector(
          onTap: () {
            // KUPOWANIE
          },
          child: Align(
              alignment: Alignment.center,
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 30),
                  child: ListView(children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          if (points >= cena) {
                            for (int i = 0; i < 32; i++) {
                              if ((i + tmp) % 8 == 0)
                                markerVisibilityList[i] = true;
                            }
                            tmp++; // żeby każdy zakup odsłaniał nowe znaczniki
                            points -= cena;
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: new Text(
                                        "Pomyślnie zakupiłeś nowe znaczniki.\nZnajdź je na mapie!"),
                                    actions: <Widget>[
                                      new FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: new Text(
                                            'Zamknij',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ))
                                    ],
                                  );
                                });
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: new Text(
                                        "Nie masz wystarczająco punktów ECTS."),
                                    actions: <Widget>[
                                      new FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: new Text(
                                            'Zamknij',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ))
                                    ],
                                  );
                                });
                          }
                        },
                        child: Card(
                            child: ListTile(
                          leading: Icon(Icons.add_location),
                          title: Text(
                            'Dokup znaczniki',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Cena: $cena ECTS',
                            style: TextStyle(fontSize: 15),
                          ),
                          trailing: Icon(Icons.shopping_cart),
                        )))
                  ])))),
    );
  }
}
