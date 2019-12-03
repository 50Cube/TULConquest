import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

int cena = 5;

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
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: ListView(children: <Widget>[
                    Card(
                        child: ListTile(
                      leading: Icon(Icons.add_location),
                      title: Text(
                        'Dokup znaczniki',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Cena: $cena ECTS',
                      style: TextStyle(
                        fontSize: 15
                      ),),
                      trailing: Icon(Icons.shopping_cart),
                    ))
                  ])))),
    );
  }
}
