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

  List<Marker> znaczniki = new List<Marker>();

  void dodajZnacznikiDoListy(
      GoogleMapController controller, List<Marker> znaczniki) {
    znaczniki.add(Marker(
        markerId: MarkerId('Znacznik'),
        draggable: false,
        onTap: () {
          controller.animateCamera(
              CameraUpdate.newLatLngZoom(LatLng(51.746, 19.453), 19.0));
          setState(() {
            rozwinButtonVisibility = !rozwinButtonVisibility;
          });
        },
        position: LatLng(51.746, 19.453)));
  }

  bool normalMapButtonVisibility = false;
  bool satelliteMapButtonVisibility = false;
  bool rozwinButtonVisibility = false;
  MapType mapType = MapType.satellite;
  double satelliteIconBorder = 2.0;
  double normalIconBorder = 0.5;

  double rozwinButtonHeight = 40.0;
  bool rozwinTextVisibility = true;
  bool arrowUpVisibility = true;
  bool arrowDownVisibility = false;
  bool zwinTextVisibility = false;
  bool sprawdzButtonVisiibility = false;

  Location location = Location();
  LocationData currentLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    location.onLocationChanged().listen((value) {
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
                  )),
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
                    title: Text('O programie',
                        style: TextStyle(
                          fontSize: 22.0,
                        )),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainRoute()),
                      );
                    }),
                ListTile(
                    title: Text('Zakończ',
                        style: TextStyle(
                          fontSize: 22.0,
                        )),
                    onTap: () {
                      SystemNavigator.pop();
                    })
              ])),
        ),
        body: Stack(children: [
          Container(
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
              alignment: Alignment(0.93, -0.78),
              child: InkWell(
                  // Wybor rodzaju mapy
                  onTap: () {
                    setState(() {
                      normalMapButtonVisibility = !normalMapButtonVisibility;
                      satelliteMapButtonVisibility =
                          !satelliteMapButtonVisibility;
                    });
                  },
                  child: Opacity(
                      opacity: 0.8,
                      child: Container(
                        height: 39.0,
                        width: 39.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: Colors.white,
                          border: Border.all(width: 0.5),
                        ),
                        child: Icon(Icons.layers, color: Colors.black54),
                      )))),
          Align(
              alignment: Alignment(0.93, -0.62),
              child: InkWell(
                // normalna mapa
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
                  child: Opacity(
                      opacity: 0.8,
                      child: Container(
                        height: 39.0,
                        width: 39.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: Colors.white,
                          border: Border.all(
                              width: normalIconBorder, color: Colors.black),
                        ),
                        child: Icon(Icons.map, color: Colors.black54),
                      )),
                ),
              )),
          Align(
              alignment: Alignment(0.93, -0.46),
              child: InkWell(
                // mapa satelita
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
                        height: 39.0,
                        width: 39.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: Colors.white,
                          border: Border.all(
                              width: satelliteIconBorder, color: Colors.black),
                        ),
                        child: Icon(Icons.satellite, color: Colors.black54),
                      ),
                    )),
              )),

          Align(
              // ROZWIN
              alignment: Alignment(0, 0.8),
              child: Visibility(
                  visible: rozwinButtonVisibility,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 350),
                    height: rozwinButtonHeight,
                    width: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                      border: Border.all(width: 2.0, color: Colors.black),
                    ),
                    child: Stack(
                        children: <Widget>[
                          GestureDetector(
                          // SPRAWDZ
                          onTap: () {
                            setState(() {});
                          },
                          child: Align(
                            alignment: Alignment(0, 0.6),
                            child: Visibility(
                              visible: sprawdzButtonVisiibility,
                              child: Container(
                                width: 150.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                      color: Colors.black, width: 2.0),
                                ),
                                child: Text(
                                  'SPRAWDŹ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          )),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                              // NAPIS ROZWIN
                              onTap: () {
                                setState(() {
                                  rozwinTextVisibility = false;
                                  arrowUpVisibility = false;
                                  zwinTextVisibility = true;
                                  arrowDownVisibility = true;
                                  rozwinButtonHeight = 440.0;
                                  sprawdzButtonVisiibility = true;
                                });
                              },
                              child: Align(
                                alignment: Alignment(0, 0.8),
                                child: Visibility(
                                  visible: rozwinTextVisibility,
                                  child: Container(
                                    width: 100.0,
                                    margin: EdgeInsets.fromLTRB(60, 4, 0, 0),
                                    child: Text(
                                      'ROZWIŃ',
                                      style: TextStyle(
                                        fontSize: 25.0,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          GestureDetector(
                              // STRZALKA W GORE
                              onTap: () {
                                setState(() {
                                  rozwinTextVisibility = false;
                                  arrowUpVisibility = false;
                                  zwinTextVisibility = true;
                                  arrowDownVisibility = true;
                                  rozwinButtonHeight = 440.0;
                                  sprawdzButtonVisiibility = true;
                                });
                              },
                              child: Align(
                                  alignment: Alignment(0, 0.8),
                                  child: Visibility(
                                      visible: arrowUpVisibility,
                                      child: Container(
                                        width: 30.0,
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                                        child: Icon(
                                          Icons.arrow_upward,
                                        ),
                                      )))),
                          GestureDetector(
                              // NAPIS ZWIN
                              onTap: () {
                                setState(() {
                                  zwinTextVisibility = false;
                                  arrowDownVisibility = false;
                                  rozwinTextVisibility = true;
                                  arrowUpVisibility = true;
                                  rozwinButtonHeight = 40.0;
                                  sprawdzButtonVisiibility = false;
                                });
                              },
                              child: Align(
                                alignment: Alignment(0, 0.94),
                                child: Visibility(
                                  visible: zwinTextVisibility,
                                  child: Container(
                                    width: 70.0,
                                    margin: EdgeInsets.fromLTRB(75, 0, 0, 0),
                                    child: Text(
                                      'ZWIŃ',
                                      style: TextStyle(
                                        fontSize: 25.0,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          GestureDetector(
                              // STRZALKA W DOL
                              onTap: () {
                                setState(() {
                                  zwinTextVisibility = false;
                                  arrowDownVisibility = false;
                                  rozwinTextVisibility = true;
                                  arrowUpVisibility = true;
                                  rozwinButtonHeight = 40.0;
                                  sprawdzButtonVisiibility = false;
                                });
                              },
                              child: Align(
                                  alignment: Alignment(0, 0.94),
                                  child: Visibility(
                                      visible: arrowDownVisibility,
                                      child: Container(
                                        width: 30.0,
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                                        child: Icon(
                                          Icons.arrow_downward,
                                        ),
                                      )))),
                        ],
                      )
                    ]),
                  ))),
        ]),
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
              child: Text('KURWA')),
        ));
  }
}
