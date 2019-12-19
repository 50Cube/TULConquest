import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tul_conquest/homescreen.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MyApp());

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
bool textFieldVisibility = false;

bool zamknijPanelVisibility = false;
double zamknijPanelPolozenie = 0.8;

bool tekstPoSprawdzeniuVisibility = false;
String tekstPoSprawdzeniu = "Podejdź bliżej";
final wprowadzonyTekst = TextEditingController();

String tekstZagadki = "Kwestionariusz";
String kluczZagadki = "HeRb";
bool tekstZagadkiVisibility = false;

LatLng lokacjaZnacznika = new LatLng(0, 0);

Location location = Location();
LocationData currentLocation;


double dist = 0;
double szerokoscOkna = 0;
double wysokoscOkna = 0;

int aktualnyZnacznik = 0;

List<bool> markerVisibilityList = new List();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void funkcjaZnacznikow() {
    rozwinButtonVisibility = true;
    zamknijPanelVisibility = true;
    funcThatMakesAsyncCall();
    zamknijPanelPolozenie = 0.8;
  }

  void dodajZnacznikiDoListy(GoogleMapController controller,
      List<Marker> znaczniki) {
    for (int i = 0; i < 32; i++) {
      if (i % 8 == 0)
        markerVisibilityList.add(true);
      else
        markerVisibilityList.add(false);
    }
    znaczniki.add(Marker(
        markerId: MarkerId('fitfabric'),
        draggable: false,
        visible: markerVisibilityList[0],
        //w reszcie 1, 2, 3 ...
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747000, 19.451992), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Dyscyplina sportu";
            kluczZagadki = "Squash";
            lokacjaZnacznika = new LatLng(51.747000, 19.451992);
            aktualnyZnacznik = 0;
          });
        },
        position: LatLng(51.747000, 19.451992)));
    znaczniki.add(Marker(
        markerId: MarkerId('galanz'),
        draggable: false,
        visible: markerVisibilityList[1],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747344, 19.455063), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "_lan_";
            kluczZagadki = "Gaz";
            lokacjaZnacznika = new LatLng(51.747344, 19.455063);
            aktualnyZnacznik = 1;
          });
        },
        position: LatLng(51.747344, 19.455063)));
    znaczniki.add(Marker(
        markerId: MarkerId('Zegarek'),
        draggable: false,
        visible: markerVisibilityList[2],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.745060, 19.453975), 19.0));
            funkcjaZnacznikow();
            tekstZagadki =
            "Która godzina?\n\n(Wprowadź godzinę w formacie hh:mm)";
            kluczZagadki = "12:10";
            lokacjaZnacznika = new LatLng(51.745060, 19.453975);
            aktualnyZnacznik = 2;
          });
        },
        position: LatLng(51.745060, 19.453975)));
    znaczniki.add(Marker(
        markerId: MarkerId('Klodka'),
        draggable: false,
        visible: markerVisibilityList[3],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747794, 19.454366), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Data na kłódce";
            kluczZagadki = "20.03";
            lokacjaZnacznika = new LatLng(51.747794, 19.454366);
            aktualnyZnacznik = 3;
          }
          );
        },
        position: LatLng(51.747794, 19.454366)));
    znaczniki.add(Marker(
        markerId: MarkerId('Posag'),
        draggable: false,
        visible: markerVisibilityList[4],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.746690, 19.453912), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Nazwisko rektora PŁ";
            kluczZagadki = "Krysiński";
            lokacjaZnacznika = new LatLng(51.746690, 19.453912);
            aktualnyZnacznik = 4;
          }
          );
        },
        position: LatLng(51.746690, 19.453912)));
    znaczniki.add(Marker(
        markerId: MarkerId('Dziekanat'),
        draggable: false,
        visible: markerVisibilityList[5],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747465, 19.455995), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Dziekanat ... Logistyki";
            kluczZagadki = "Kolegium";
            lokacjaZnacznika = new LatLng(51.747465, 19.455995);
            aktualnyZnacznik = 5;
          }
          );
        },
        position: LatLng(51.747465, 19.455995)));
    znaczniki.add(Marker(
        markerId: MarkerId('Budownictwo'),
        draggable: false,
        visible: markerVisibilityList[6],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747634, 19.451893), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Ilość tabliczek:";
            kluczZagadki = "9";
            lokacjaZnacznika = new LatLng(51.747634, 19.451893);
            aktualnyZnacznik = 6;
          }
          );
        },
        position: LatLng(51.747634, 19.451893)));
    znaczniki.add(Marker(
        markerId: MarkerId('Dzial transferu technologi'),
        draggable: false,
        visible: markerVisibilityList[7],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.748952, 19.454690), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Jaka administracja?";
            kluczZagadki = "Rektorska";
            lokacjaZnacznika = new LatLng(51.748952, 19.454690);
            aktualnyZnacznik = 7;
          }
          );
        },
        position: LatLng(51.748952, 19.454690)));
    znaczniki.add(Marker(
        markerId: MarkerId('Rektorat PL'),
        draggable: false,
        visible: markerVisibilityList[8],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.748810, 19.455350), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Kto był właścicielem willi?";
            kluczZagadki = "Reinhold Richter";
            lokacjaZnacznika = new LatLng(51.748810, 19.455350);
            aktualnyZnacznik = 8;
          }
          );
        },
        position: LatLng(51.748810, 19.455350)));
    znaczniki.add(Marker(
        markerId: MarkerId('szambo'),
        draggable: false,
        visible: markerVisibilityList[23],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747708, 19.453324), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Rok";
            kluczZagadki = "1558";
            lokacjaZnacznika = new LatLng(51.747708, 19.453324);
            aktualnyZnacznik = 23;
          }
          );
        },
        position: LatLng(51.747708, 19.453324)));
    znaczniki.add(Marker(
        markerId: MarkerId('Rozdzielnia'),
        draggable: false,
        visible: markerVisibilityList[10],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.746909, 19.456282), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Ile V?";
            kluczZagadki = "400";
            lokacjaZnacznika = new LatLng(51.746909, 19.456282);
            aktualnyZnacznik = 10;
          }
          );
        },
        position: LatLng(51.746909, 19.456282)));
    znaczniki.add(Marker(
        markerId: MarkerId('CTI'),
        draggable: false,
        visible: markerVisibilityList[11],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747198, 19.456007), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Wersja dydaktyki";
            kluczZagadki = "2.0";
            lokacjaZnacznika = new LatLng(51.747198, 19.456007);
            aktualnyZnacznik = 11;
          }
          );
        },
        position: LatLng(51.747198, 19.456007)));
    znaczniki.add(Marker(
        markerId: MarkerId('BudynekBPokoj15'),
        draggable: false,
        visible: markerVisibilityList[12],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.746465, 19.455791), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Numer budynku";
            kluczZagadki = "B15";
            lokacjaZnacznika = new LatLng(51.746465, 19.455791);
            aktualnyZnacznik = 12;
          }
          );
        },
        position: LatLng(51.746465, 19.455791)));
    znaczniki.add(Marker(
        markerId: MarkerId('BudynekBPokoj14'),
        draggable: false,
        visible: markerVisibilityList[13],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.746409, 19.455395), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Kto chroni obiekt?";
            kluczZagadki = "Magnum";
            lokacjaZnacznika = new LatLng(51.746409, 19.455395);
            aktualnyZnacznik = 13;
          }
          );
        },
        position: LatLng(51.746409, 19.455395)));
    znaczniki.add(Marker(
        markerId: MarkerId('drogowskazybiblio'),
        draggable: false,
        visible: markerVisibilityList[14],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.745674, 19.455323), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Liczba drogowskazów";
            kluczZagadki = "6";
            lokacjaZnacznika = new LatLng(51.745674, 19.455323);
            aktualnyZnacznik = 14;
          }
          );
        },
        position: LatLng(51.745674, 19.455323)));
    znaczniki.add(Marker(
        markerId: MarkerId('b8regulaminwyjazd'),
        draggable: false,
        visible: markerVisibilityList[15],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747571, 19.450931), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Telefon do Dowódcy Straży Politechniki Łódzkiej";
            kluczZagadki = "631 29 07";
            lokacjaZnacznika = new LatLng(51.747571, 19.450931);
            aktualnyZnacznik = 15;
          }
          );
        },
        position: LatLng(51.747571, 19.450931)));
    znaczniki.add(Marker(
        markerId: MarkerId('Kropka'),
        draggable: false,
        visible: markerVisibilityList[16],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747704, 19.452855), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Kto zaprasza na zakupy?";
            kluczZagadki = "Kropka";
            lokacjaZnacznika = new LatLng(51.747704, 19.452855);
            aktualnyZnacznik = 16;
          }
          );
        },
        position: LatLng(51.747704, 19.452855)));
    znaczniki.add(Marker(
        markerId: MarkerId('drukA4'),
        draggable: false,
        visible: markerVisibilityList[17],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747965, 19.451947), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Największy format druku";
            kluczZagadki = "A0";
            lokacjaZnacznika = new LatLng(51.747965, 19.451947);
            aktualnyZnacznik = 17;
          }
          );
        },
        position: LatLng(51.747965, 19.451947)));
    znaczniki.add(Marker(
        markerId: MarkerId('szlabanWyjazd'),
        draggable: false,
        visible: markerVisibilityList[18],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747796, 19.450893), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Opłata za zgubiony bilet";
            kluczZagadki = "50";
            lokacjaZnacznika = new LatLng(51.747796, 19.450893);
            aktualnyZnacznik = 18;
          }
          );
        },
        position: LatLng(51.747796, 19.450893)));
    znaczniki.add(Marker(
        markerId: MarkerId('bezLipy'),
        draggable: false,
        visible: markerVisibilityList[19],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.748666, 19.453617), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Bez";
            kluczZagadki = "Lipy";
            lokacjaZnacznika = new LatLng(51.748666, 19.453617);
            aktualnyZnacznik = 19;
          }
          );
        },
        position: LatLng(51.748666, 19.453617)));
    znaczniki.add(Marker(
        markerId: MarkerId('pomnikNatury'),
        draggable: false,
        visible: markerVisibilityList[20],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.748359, 19.455163), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Podstawa bryły tworzonej przez podpory drzewa to:";
            kluczZagadki = "Trójkąt";
            lokacjaZnacznika = new LatLng(51.748359, 19.455163);
            aktualnyZnacznik = 20;
          }
          );
        },
        position: LatLng(51.748359, 19.455163)));
    znaczniki.add(Marker(
        markerId: MarkerId('Instytut przeplywowy'),
        draggable: false,
        visible: markerVisibilityList[21],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.746696, 19.454084), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Adres URL instytutu:";
            kluczZagadki = "www.imp.p.lodz.pl";
            lokacjaZnacznika = new LatLng(51.746696, 19.454084);
            aktualnyZnacznik = 21;
          }
          );
        },
        position: LatLng(51.746696, 19.454084)));
    znaczniki.add(Marker(
        markerId: MarkerId('wjazdodwolczanskiej5m'),
        draggable: false,
        visible: markerVisibilityList[22],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.748300, 19.456389), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Bezpieczny dystans";
            kluczZagadki = "5m";
            lokacjaZnacznika = new LatLng(51.748300, 19.456389);
            aktualnyZnacznik = 22;
          }
          );
        },
        position: LatLng(51.748300, 19.456389)));
    znaczniki.add(Marker(
        markerId: MarkerId('rainbowtours'),
        draggable: false,
        visible: markerVisibilityList[9],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.748921, 19.456253), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Znajdź tęczę";
            kluczZagadki = "Rainbow";
            lokacjaZnacznika = new LatLng(51.748921, 19.456253);
            aktualnyZnacznik = 9;
          }
          );
        },
        position: LatLng(51.748921, 19.456253)));
    znaczniki.add(Marker(
        markerId: MarkerId('papiernictwo'),
        draggable: false,
        visible: markerVisibilityList[24],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.746006, 19.454548), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Instytut papiernictwa i ... Politechniki Łódzkiej";
            kluczZagadki = "Poligrafii";
            lokacjaZnacznika = new LatLng(51.746006, 19.454548);
            aktualnyZnacznik = 24;
          }
          );
        },
        position: LatLng(51.746006, 19.454548)));
    znaczniki.add(Marker(
        markerId: MarkerId('posagwlesie'),
        draggable: false,
        visible: markerVisibilityList[25],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.748593, 19.453803), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Idzie zima";
            kluczZagadki = "Załóż czapkę";
            lokacjaZnacznika = new LatLng(51.748593, 19.453803);
            aktualnyZnacznik = 25;
          }
          );
        },
        position: LatLng(51.748593, 19.453803)));
    znaczniki.add(Marker(
        markerId: MarkerId('przywyjezdzie na wolczanska'),
        draggable: false,
        visible: markerVisibilityList[26],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.746099, 19.456230), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Ilość słów";
            kluczZagadki = "8";
            lokacjaZnacznika = new LatLng(51.746099, 19.456230);
            aktualnyZnacznik = 26;
          }
          );
        },
        position: LatLng(51.746099, 19.456230)));
    znaczniki.add(Marker(
        markerId: MarkerId('przybiblotece'),
        draggable: false,
        visible: markerVisibilityList[27],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.745681, 19.453580), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Ilość kafelków w drzwiach";
            kluczZagadki = "24";
            lokacjaZnacznika = new LatLng(51.745681, 19.453580);
            aktualnyZnacznik = 27;
          }
          );
        },
        position: LatLng(51.745681, 19.453580)));
    znaczniki.add(Marker(
        markerId: MarkerId('nfz'),
        draggable: false,
        visible: markerVisibilityList[28],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747209, 19.455656), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Ile godzin dziennie czynne";
            kluczZagadki = "10";
            lokacjaZnacznika = new LatLng(51.747209, 19.455656);
            aktualnyZnacznik = 28;
          }
          );
        },
        position: LatLng(51.747209, 19.455656)));
    znaczniki.add(Marker(
        markerId: MarkerId('przylodexie'),
        draggable: false,
        visible: markerVisibilityList[29],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747127, 19.453993), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Rok:";
            kluczZagadki = "2004";
            lokacjaZnacznika = new LatLng(51.747127, 19.453993);
            aktualnyZnacznik = 29;
          }
          );
        },
        position: LatLng(51.747127, 19.453993)));
    znaczniki.add(Marker(
        markerId: MarkerId('zporr'),
        draggable: false,
        visible: markerVisibilityList[30],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.745913, 19.455619), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "Skrót na tablicy";
            kluczZagadki = "ZPORR";
            lokacjaZnacznika = new LatLng(51.745913, 19.455619);
            aktualnyZnacznik = 30;
          }
          );
        },
        position: LatLng(51.745913, 19.455619)));
    znaczniki.add(Marker(
        markerId: MarkerId('cj'),
        draggable: false,
        visible: markerVisibilityList[31],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          this.setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.745371, 19.451457), 19.0));
            funkcjaZnacznikow();
            tekstZagadki = "W razie niebezpiecześtwa ...";
            kluczZagadki = "Zbić szybkę";
            lokacjaZnacznika = new LatLng(51.745371, 19.451457);
            aktualnyZnacznik = 31;
          }
          );
        },
        position: LatLng(51.745371, 19.451457)));
  }


  Future funcThatMakesAsyncCall() async {
    var result = await Geolocator().distanceBetween(currentLocation.latitude, currentLocation.longitude, lokacjaZnacznika.latitude, lokacjaZnacznika.longitude);
    this.setState(() {
      dist = result;
    });
  }

  @override
  void initState() {
    super.initState();
    location.onLocationChanged().listen((value) {
      setState(() {
        currentLocation = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    dodajZnacznikiDoListy(mapController, znaczniki);
    //szerokoscOkna = 800;
    //wysokoscOkna = 400;
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new HomeScreen());
  }
}