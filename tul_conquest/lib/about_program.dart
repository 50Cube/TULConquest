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
            //border: Border.all(width: 2.0, color: Colors.black),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                spreadRadius: 10,
                offset: Offset(4,4)
              )
            ]
          ),
          child: Text(
            'Lochy to kurwy',
            style: TextStyle(
              fontSize: 20
            )
          ),
        )
      ),
    );
  }
}