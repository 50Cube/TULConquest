import 'package:flutter/material.dart';

int points = 0;

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Your Profile"),
            backgroundColor: Colors.indigo[800]
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: (
                Text(
                  '$points',
                  style: TextStyle(fontSize: 30.0)
                )
            )
          ),
        ));
  }
}


