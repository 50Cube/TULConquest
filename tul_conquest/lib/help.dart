import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tul_conquest/main.dart';

class HelpRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("O Programie"),
          backgroundColor: Colors.indigo[800]
      ),
      body: Center(
          child: Container(
            height: wysokoscOkna * 0.8,
            width: szerokoscOkna * 0.8,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      spreadRadius: 10,
                      offset: Offset(4,4)
                  )
                ]
            ),
            child: ListView(
                children: <Widget>[
                  Text(
                      '1. Co robić, po gdy kliknięciu znacznika nic się nie dzieje?',
                      style: TextStyle(
                          fontSize: 18,
                        fontWeight: FontWeight.bold
                      )
                  ),
                  Text(
                        'Upewnij się, że internet i GPS jest włączony oraz zrestartuj aplikację.',
                        style: TextStyle(
                            fontSize: 18
                        ),
                      ),
                  Text(
                      '\n\n2. Czy muszę używać polskich znaków w hasłach?',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  Text(
                    'Polskie znaki oraz spacje mają znaczenie, natomiast wielkość liter nie wpływa na poprawność odpowiedzi.',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  ),
                  Text(
                      '\n\n3. Co to jest za herb?',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  Text(
                    'Herb? A, to nie jest herb. To jest logo strategii rozwoju Politechniki Łódzkiej.',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  )
                ]),
          )
      ),
    );
  }
}