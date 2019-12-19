import 'package:flutter/material.dart';
import 'package:tul_conquest/main.dart';

int points=5;
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text("Profil"), backgroundColor: Colors.indigo[800]),
        body: Center(
          child:
            Container(
              height: wysokoscOkna * 0.6,
              width: szerokoscOkna * 0.75,
              padding: EdgeInsets.all(10),
              child: Stack(children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'TWOJE PUNKTY',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28
                    ),
                  )
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: wysokoscOkna * 0.3,
                    width: szerokoscOkna * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              spreadRadius: 10,
                              offset: Offset(4,4)
                          )
                        ]
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                          '$points',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 70
                        ),
                      ),
                    )
                )),
              ])

            ),
        ));
  }
}
