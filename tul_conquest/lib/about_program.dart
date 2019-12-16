import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class About_programRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("O Programie"),
          backgroundColor: Colors.indigo[800]
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.75,
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
          child: Stack(
            children: <Widget>[
          Text(
            'Poznaj kampus B lepiej!\n\nPodchodź do znaczników na mapie i rozglądaj się uważnie, aby znaleźć odpowiedź na zadane pytanie. '
                'W ten sposób zdobywaj punkty ECTS. '
                'Jeśli rozwiązałeś już wszystkie zagadki w zakładce Sklep możesz wykorzystać zebrane punkty i wykupić nowe znaczniki.',
            style: TextStyle(
              fontSize: 18
            )
          ),
            Align (
              alignment: Alignment.bottomLeft,
                child: Text(
              'Autorzy:\nJakub Bogdan\nPrzemysław Komuda\nSzymon Rutkowski',
                  style: TextStyle(
                    fontSize: 12
                  ),
            ))]),
        )
      ),
    );
  }
}