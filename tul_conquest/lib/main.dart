import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(51.746772, 19.453217);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('TUL CONQUEST'),
          backgroundColor: Colors.indigo[800],
        ),
        drawer: SizedBox(
          width: 180,
          child: Drawer(
              child: ListView(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/sail.png'),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                ListTile(
                  title: Text('Sklep',
                      style: TextStyle(
                        fontSize: 22.0,
                      )),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Ustawienia',
                      style: TextStyle(
                        fontSize: 22.0,
                      )),
                  onTap: () {},
                ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'O programie',
                        style: TextStyle(
                          fontSize: 22.0,
                        )
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainRoute()),
                        );
                      }
                    ),
                    ListTile(
                        title: Text(
                            'Zakończ',
                            style: TextStyle(
                              fontSize: 22.0,
                            )
                        ),
                        onTap: () {
                          SystemNavigator.pop();
                        }
                    )
              ])),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 19.0,
          ),
        ),
      ),
    );
  }
  }

  class MainRoute extends StatelessWidget
  {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('CHUJ'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
            },
          child: Text('KURWA')
            ),
        )
      );
  }
}
