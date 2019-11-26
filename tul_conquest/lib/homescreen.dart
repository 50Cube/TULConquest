import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tul_conquest/main.dart';
import 'package:vibration/vibration.dart';
import 'about_program.dart';

final LatLng _center = const LatLng(51.746772, 19.453217);
List<Marker> znaczniki = new List<Marker>();
GoogleMapController mapController;

void _onMapCreated(GoogleMapController controller) {
  mapController = controller;
}
class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}


class HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                          MaterialPageRoute(builder: (context) => SecondRoute()),
                        );
                      }),
                  ListTile(
                      title: Text('Zakończ',
                          style: TextStyle(
                            fontSize: 22.0,
                          )),
                      onTap: () {
                        //SystemNavigator.pop();
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
              zoom: 18.0,
            ),
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            mapType: mapType,
            markers: Set.from(znaczniki),
          ),
        ),
//              Align(
//                alignment: Alignment.center,
//                child: Container(
//                    child:
//                  Text("Location" + dist.toString() + "  " + wprowadzonyTekst.text)
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

        Align(                                // ROZWIN
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
                        Align(                  // TEKST ZAGADKI
                            alignment: Alignment(0, -0.88),
                            child: Visibility(
                                visible: tekstZagadkiVisibility,
                                child: Container(
                                    height: 200.0,
                                    width: 210.0,
                                    child: Text(
                                        tekstZagadki,
                                        style: TextStyle(
                                            fontSize: 20.0
                                        )
                                    )
                                )
                            )
                        ),
                        Align(                  // POLE DO WPISYWANIA
                            alignment: Alignment(0,0.3),
                            child: Visibility(
                                visible: textFieldVisibility,
                                child: Container(
                                    width: 200,
                                    height: 40,
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      maxLength: 20,
                                      controller: wprowadzonyTekst,
                                      decoration: InputDecoration(
                                        hintText: 'Wpisz odpowiedź',
                                      ),
                                    )
                                ))),

                        GestureDetector(         // SPRAWDZ
                            onTap: () {
                              setState(() {
                                if (dist > 100) {
                                  Vibration.vibrate(duration: 500);
                                  tekstPoSprawdzeniu = "Podejdź bliżej";
                                }
                                else if (wprowadzonyTekst.text.toUpperCase().trimLeft().trimRight() == kluczZagadki.toUpperCase().trimLeft().trimRight()) {
                                  tekstPoSprawdzeniu = "DOBRZE"; }
                                else {
                                  Vibration.vibrate(duration: 500);
                                  tekstPoSprawdzeniu = "ŹLE";
                                }
                                tekstPoSprawdzeniuVisibility = true;
                              });
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
                        Align(                            // PODEJDŹ BLIŻEJ
                            alignment: Alignment(0, 0.82),
                            child: Visibility(
                                visible: tekstPoSprawdzeniuVisibility,
                                child: Container(
                                    width: 150,
                                    height: 35,
                                    child: Text(
                                        tekstPoSprawdzeniu,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.red
                                        )
                                    )
                                )
                            )
                        ),
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
                                    textFieldVisibility = true;
                                    tekstZagadkiVisibility = true;
                                    wprowadzonyTekst.text = "";
                                    zamknijPanelPolozenie = -0.42;
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
                                    textFieldVisibility = true;
                                    tekstZagadkiVisibility = true;
                                    wprowadzonyTekst.text = "";
                                    zamknijPanelPolozenie = -0.42;
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
                                    textFieldVisibility = false;
                                    tekstZagadkiVisibility = false;
                                    tekstPoSprawdzeniuVisibility = false;
                                    zamknijPanelPolozenie = 0.8;
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
                                    textFieldVisibility = false;
                                    tekstZagadkiVisibility = false;
                                    tekstPoSprawdzeniuVisibility = false;
                                    zamknijPanelPolozenie = 0.8;
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
        GestureDetector(                              // ZAMKNIECIE PANELU
            onTap: () {
              setState(() {
                rozwinButtonVisibility = false;
                zamknijPanelVisibility = false;
                rozwinButtonHeight = 40.0;
                zwinTextVisibility = false;
                arrowDownVisibility = false;
                rozwinTextVisibility = true;
                arrowUpVisibility = true;
                sprawdzButtonVisiibility = false;
                textFieldVisibility = false;
                tekstZagadkiVisibility = false;
                tekstPoSprawdzeniuVisibility = false;
              });
            },
            child: Align(
                alignment: Alignment(0.635, zamknijPanelPolozenie),
                child: Visibility(
                    visible: zamknijPanelVisibility,
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      child: Icon(
                          Icons.close
                      ),
                    )
                )
            )
        ),
      ]),
    );
  }
}