import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tul_conquest/markers.dart';
import 'package:location/location.dart';

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
  double satelliteIconBorder = 2.0;
  double normalIconBorder = 0.5;


  Location location = Location();
  LocationData currentLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    location.onLocationChanged().listen((value){
      setState(() {
        currentLocation = value;
      });
    });
  }


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }


  @override
  Widget build(BuildContext context) {
    dodajZnacznikiDoListy(mapController, znaczniki);
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
                  bearing: 0,
                  target: _center,
                  zoom: 19.0,
                ),
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                mapType: mapType,
                markers: Set.from(znaczniki),
              ),
            ),
//              new Align(
//                alignment: Alignment.center,
//                child: Container(
//                    child:
//                    Text("Location" + currentLocation.latitude.toString() + " " + currentLocation.longitude.toString())
//                )
//              ),
              new Align(
                  alignment: Alignment(-0.92,-0.96),
                  child: InkWell( // Wybor rodzaju mapy
                      onTap: () {
                        setState(() {
                          normalMapButtonVisibility = !normalMapButtonVisibility;
                          satelliteMapButtonVisibility = !satelliteMapButtonVisibility;
                        });
                      },
                      child: Opacity(
                        opacity: 0.8,
                          child: Container(
                        height: 48.0,
                        width: 48.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            border: Border.all(width: 0.5),
                        ),
                        child: Icon(Icons.layers, color: Colors.black54),
                      )
                  )
                  )
              ),
                Align(
                  alignment: Alignment(-0.55,-0.96),
                  child: InkWell( // normalna mapa
                    onTap: () {
                      setState(() {
                        mapType = MapType.normal;
                        normalIconBorder = 2.0;
                        satelliteIconBorder = 0.5;
                        print("normal map clicked");
                      });
                    },
                    child: Visibility(
                        visible: normalMapButtonVisibility,
                        child: Opacity (
                            opacity: 0.8,
                            child: Container(
                          height: 48.0,
                          width: 48.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            border: Border.all(width: normalIconBorder, color: Colors.black),
                          ),
                          child: Icon(Icons.map, color: Colors.black54),
                        )
                    ),
                    ),
                  )

              ),
              Align(
                  alignment: Alignment(-0.2,-0.96),
                  child: InkWell( // mapa satelita
                    onTap: () {
                      setState(() {
                        mapType = MapType.satellite;
                        normalIconBorder = 0.5;
                        satelliteIconBorder = 2.0;
                        print("satellite map clicked");
                      });
                    },
                    child: Visibility(
                        visible: satelliteMapButtonVisibility,
                        child: Opacity(
                            opacity: 0.8,
                            child: Container(
                          height: 48.0,
                          width: 48.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            border: Border.all(width: satelliteIconBorder, color: Colors.black),
                          ),
                          child: Icon(Icons.satellite, color: Colors.black54),
                        ),
                        )
                    ),
                  )
              ),

             
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