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

  List<Marker> znaczniki = [];

  bool normalMapButtonVisibility = false;
  bool satelliteMapButtonVisibility = false;
  MapType mapType = MapType.satellite;
  Color satelliteIconColor = Colors.white;
  Color normalIconeColor = Colors.black;

  void changedVisibility(bool visibility, String name) {
    setState(() {
      if (name == "normal") {
        normalMapButtonVisibility = visibility;
      }
      if (name == "satellite") {

      }
    });
  }


  void dodajZnacznikiDoListy(GoogleMapController controller) {
    znaczniki.add(Marker(
        markerId: MarkerId('Znacznik'),
        draggable: false,
        onTap: () {
          controller.animateCamera(
              CameraUpdate.newLatLngZoom(LatLng(51.746, 19.453), 19.0));
        },
        position: LatLng(51.746, 19.453)
    ));
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    dodajZnacznikiDoListy(mapController);
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
                            MaterialPageRoute(
                                builder: (context) => MainRoute()),
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

        body: Stack(
            children: [Container(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 19.0,
                ),
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                mapType: mapType,
                markers: Set.from(znaczniki),
              ),
            ),
              new Align(
                  alignment: Alignment(0.88,-0.94),
                  child: InkWell( // Wybor rodzaju mapy
                      onTap: () {
                        setState(() {
                          normalMapButtonVisibility = !normalMapButtonVisibility;
                          satelliteMapButtonVisibility = !satelliteMapButtonVisibility;
                        });
                      },
                      child: Container(
                        height: 48.0,
                        width: 48.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.0),
                            color: Colors.indigo,
                            border: Border.all(width: 2.0)
                        ),
                        child: Icon(Icons.layers, color: Colors.white),
                      )
                  )
              ),
                Align(
                  alignment: Alignment(0.5,-0.94),
                  child: InkWell( // normalna mapa
                    onTap: () {
                      setState(() {
                        mapType = MapType.normal;
                        normalIconeColor = Colors.white;
                        satelliteIconColor = Colors.black;
                        print("normal map clicked");
                      });
                    },
                    child: Visibility(
                        visible: normalMapButtonVisibility,
                        child: Container(
                          height: 48.0,
                          width: 48.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.0),
                            color: Colors.indigo,
                            border: Border.all(width: 2.0, color: normalIconeColor),
                          ),
                          child: Icon(Icons.map, color: Colors.white),
                        )
                    ),
                  )
              ),
              Align(
                  alignment: Alignment(0.15,-0.94),
                  child: InkWell( // mapa satelita
                    onTap: () {
                      setState(() {
                        mapType = MapType.satellite;
                        normalIconeColor = Colors.black;
                        satelliteIconColor = Colors.white;
                        print("satellite map clicked");
                      });
                    },
                    child: Visibility(
                        visible: satelliteMapButtonVisibility,
                        child: Container(
                          height: 48.0,
                          width: 48.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.0),
                            color: Colors.indigo,
                            border: Border.all(width: 2.0, color: satelliteIconColor),
                          ),
                          child: Icon(Icons.satellite, color: Colors.white),
                        )
                    ),
                  )
              ),

              Align(
                  alignment: Alignment(0.87,-0.72),
                  child: InkWell( // camera button
                      onTap: () {
                        // move camera on my position
                        print("camera button clicked");
                      },
                      child: Container(
                        height: 45.0,
                        width: 45.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.indigo,
                          border: Border.all(width: 2.0),
                        ),
                        child: Icon(
                            Icons.my_location,
                            color: Colors.white
                        ),
                      )
                  )
              )
            ]
        ),
      ),
    );
  }
}

class MainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
