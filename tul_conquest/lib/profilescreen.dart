import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

int points=3;
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
            splashColor: Colors.cyan,
            onPressed: () {
              writeCounter(points);
              Navigator.pop(context);
            },
            child: Text('Go back!'),
          ),
        ));
  }
}


Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
}
Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/counter.txt');
}
Future<File> writeCounter(int counter) async {
  final file = await _localFile;

  // Write the file.
  return file.writeAsString('$counter');
}
Future<int> readCounter() async {
  try {
    final file = await _localFile;

    // Read the file.
    String contents = await file.readAsString();

    return int.parse(contents);
  } catch (e) {
    // If encountering an error, return 0.
    return 0;
  }
}

