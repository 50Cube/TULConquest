import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tul_conquest/homescreen.dart';
import 'package:tul_conquest/markers.dart';
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

List<bool> markerVisibilityList = new List();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void dodajZnacznikiDoListy(
      GoogleMapController controller, List<Marker> znaczniki) {
    for (int i=0; i<32; i++) {
      if(i%8 == 0)
        markerVisibilityList.add(true);
      else markerVisibilityList.add(false);
    }
    znaczniki.add(Marker(
        markerId: MarkerId('fitfabric'),
        draggable: false,
        visible: markerVisibilityList[0], //w reszcie 1, 2, 3 ...
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747000, 19.451992), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Dyscyplina sportu";
            kluczZagadki = "Squash";
            lokacjaZnacznika = new LatLng(51.747000, 19.451992);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          });
        },
        position: LatLng(51.747000, 19.451992)));
    znaczniki.add(Marker(
        markerId: MarkerId('galanz'),
        draggable: false,
        visible: markerVisibilityList[1],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747344, 19.455063), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "_lan_";
            kluczZagadki = "Gaz";
            lokacjaZnacznika = new LatLng(51.747344, 19.455063);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          });
        },
        position: LatLng(51.747344, 19.455063)));
    znaczniki.add(Marker(
        markerId: MarkerId('Zegarek'),
        draggable: false,
        visible: markerVisibilityList[2],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.745060, 19.453975), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Która godzina?\n\n(Wprowadź godzinę w formacie hh:mm)";
            kluczZagadki = "12:10";
            lokacjaZnacznika = new LatLng(51.745060, 19.453975);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          });
        },
        position: LatLng(51.745060, 19.453975)));
    znaczniki.add(Marker(
        markerId: MarkerId('Klodka'),
        draggable: false,
        visible: markerVisibilityList[3],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng( 51.747794, 19.454366), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Data na kłódce";
            kluczZagadki = "20.03";
            lokacjaZnacznika = new LatLng(51.747794, 19.454366);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng( 51.747794, 19.454366)));
    znaczniki.add(Marker(
        markerId: MarkerId('Posag'),
        draggable: false,
        visible: markerVisibilityList[4],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng( 51.746690, 19.453912), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Nazwisko rektora PŁ";
            kluczZagadki = "Krysiński";
            lokacjaZnacznika = new LatLng(51.746690, 19.453912);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng( 51.746690, 19.453912)));
    znaczniki.add(Marker(
        markerId: MarkerId('Dziekanat'),
        draggable: false,
        visible: markerVisibilityList[5],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.747465, 19.455995), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Dziekanat ... Logistyki";
            kluczZagadki = "Kolegium";
            lokacjaZnacznika = new LatLng(51.747465, 19.455995);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng(  51.747465, 19.455995)));
    znaczniki.add(Marker(
        markerId: MarkerId('Budownictwo'),
        draggable: false,
        visible: markerVisibilityList[6],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.747634, 19.451893), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Ilość tabliczek:";
            kluczZagadki = "9";
            lokacjaZnacznika = new LatLng(51.747634, 19.451893);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng(  51.747634, 19.451893)));
    znaczniki.add(Marker(
        markerId: MarkerId('Dzial transferu technologi'),
        draggable: false,
        visible: markerVisibilityList[7],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.748952, 19.454690), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Jaka administracja?";
            kluczZagadki = "Rektorska";
            lokacjaZnacznika = new LatLng(51.748952, 19.454690);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng(  51.748952, 19.454690)));
    znaczniki.add(Marker(
        markerId: MarkerId('Rektorat PL'),
        draggable: false,
        visible: markerVisibilityList[8],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(   51.748810, 19.455350), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Kto był właścicielem willi?";
            kluczZagadki = "Reinhold Richter";
            lokacjaZnacznika = new LatLng(51.748810, 19.455350);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng(   51.748810, 19.455350)));
    znaczniki.add(Marker(
        markerId: MarkerId('szambo'),
        draggable: false,
        visible: markerVisibilityList[23],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.747708, 19.453324), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Rok";
            kluczZagadki = "1558";
            lokacjaZnacznika = new LatLng(51.747708, 19.453324);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng(   51.747708, 19.453324)));
    znaczniki.add(Marker(
        markerId: MarkerId('Rozdzielnia'),
        draggable: false,
        visible: markerVisibilityList[10],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(   51.746909, 19.456282), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Ile V?";
            kluczZagadki = "400";
            lokacjaZnacznika = new LatLng(51.746909, 19.456282);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng(    51.746909,19.456282)));
    znaczniki.add(Marker(
        markerId: MarkerId('CTI'),
        draggable: false,
        visible: markerVisibilityList[11],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(   51.747198, 19.456007), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Wersja dydaktyki";
            kluczZagadki = "2.0";
            lokacjaZnacznika = new LatLng(51.747198, 19.456007);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng( 51.747198,19.456007)));
    znaczniki.add(Marker(
        markerId: MarkerId('BudynekBPokoj15'),
        draggable: false,
        visible: markerVisibilityList[12],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(    51.746465, 19.455791), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Numer budynku";
            kluczZagadki = "B15";
            lokacjaZnacznika = new LatLng(51.746465, 19.455791);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng(  51.746465,19.455791)));
    znaczniki.add(Marker(
        markerId: MarkerId('BudynekBPokoj14'),
        draggable: false,
        visible: markerVisibilityList[13],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.746409,19.455395), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Kto chroni obiekt?";
            kluczZagadki = "Magnum";
            lokacjaZnacznika = new LatLng(51.746409, 19.455395);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng(  51.746409,19.455395)));
    znaczniki.add(Marker(
        markerId: MarkerId('drogowskazybiblio'),
        draggable: false,
        visible: markerVisibilityList[14],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.745674,19.455323), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Liczba drogowskazów";
            kluczZagadki = "6";
            lokacjaZnacznika = new LatLng(51.745674, 19.455323);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng(   51.745674,19.455323)));
    znaczniki.add(Marker(
        markerId: MarkerId('b8regulaminwyjazd'),
        draggable: false,
        visible: markerVisibilityList[15],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.747571,19.450931), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Telefon do Dowódcy Straży Politechniki Łódzkiej";
            kluczZagadki = "631 29 07";
            lokacjaZnacznika = new LatLng(51.747571, 19.450931);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng(  51.747571,19.450931)));
    znaczniki.add(Marker(
        markerId: MarkerId('Kropka'),
        draggable: false,
        visible: markerVisibilityList[16],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747704,19.452855), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Kto zaprasza na zakupy?";
            kluczZagadki = "Kropka";
            lokacjaZnacznika = new LatLng(51.747704, 19.452855);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng(51.747704,19.452855)));
    znaczniki.add(Marker(
        markerId: MarkerId('drukA4'),
        draggable: false,
        visible: markerVisibilityList[17],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.747965,19.451947), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Największy format druku";
            kluczZagadki = "A0";
            lokacjaZnacznika = new LatLng(51.747965, 19.451947);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng(  51.747965,19.451947)));
    znaczniki.add(Marker(
        markerId: MarkerId('szlabanWyjazd'),
        draggable: false,
        visible: markerVisibilityList[18],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng( 51.747796, 19.450893), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Opłata za zgubiony bilet";
            kluczZagadki = "50";
            lokacjaZnacznika = new LatLng(51.747796, 19.450893);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng( 51.747796, 19.450893)));
    znaczniki.add(Marker(
        markerId: MarkerId('bezLipy'),
        draggable: false,
        visible: markerVisibilityList[19],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng( 51.748666, 19.453617), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Bez";
            kluczZagadki = "Lipy";
            lokacjaZnacznika = new LatLng(51.748666, 19.453617);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng( 51.748666, 19.453617)));
    znaczniki.add(Marker(
        markerId: MarkerId('pomnikNatury'),
        draggable: false,
        visible: markerVisibilityList[20],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng( 51.748359, 19.455163), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Podstawa bryły tworzonej przez podpory drzewa to:";
            kluczZagadki = "Trójkąt";
            lokacjaZnacznika = new LatLng(51.748359, 19.455163);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng( 51.748359, 19.455163)));
    znaczniki.add(Marker(
        markerId: MarkerId('Instytut przeplywowy'),
        draggable: false,
        visible: markerVisibilityList[21],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng( 51.746696, 19.454084), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Adres URL instytutu:";
            kluczZagadki = "www.imp.p.lodz.pl";
            lokacjaZnacznika = new LatLng(51.746696, 19.454084);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
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
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.748300, 19.456389), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Bezpieczny dystans";
            kluczZagadki = "5m";
            lokacjaZnacznika = new LatLng(51.748300, 19.456389);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng( 51.748300, 19.456389)));
    znaczniki.add(Marker(
        markerId: MarkerId('rainbowtours'),
        draggable: false,
        visible: markerVisibilityList[9],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.748921,  19.456253), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Znajdź tęczę";
            kluczZagadki = "Rainbow";
            lokacjaZnacznika = new LatLng(51.748921, 19.456253);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng( 51.748921,  19.456253)));
    znaczniki.add(Marker(
        markerId: MarkerId('papiernictwo'),
        draggable: false,
        visible: markerVisibilityList[24],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.746006, 19.454548), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Instytut papiernictwa i ... Politechniki Łódzkiej";
            kluczZagadki = "Poligrafii";
            lokacjaZnacznika = new LatLng(51.746006, 19.454548);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
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
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.748593, 19.453803), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Idzie zima";
            kluczZagadki = "Załóż czapkę";
            lokacjaZnacznika = new LatLng(51.748593, 19.453803);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
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
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.746099, 19.456230), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Ilość słów";
            kluczZagadki = "8";
            lokacjaZnacznika = new LatLng(51.746099, 19.456230);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
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
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.745681, 19.453580), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Ilość kafelków w drzwiach";
            kluczZagadki = "24";
            lokacjaZnacznika = new LatLng(51.745681, 19.453580);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
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
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747209, 19.455656), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Ile godzin dziennie czynne";
            kluczZagadki = "10";
            lokacjaZnacznika = new LatLng(51.747209, 19.455656);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
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
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747127, 19.453993), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Rok:";
            kluczZagadki = "2004";
            lokacjaZnacznika = new LatLng(51.747127, 19.453993);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
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
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.745913, 19.455619), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "Skrót na tablicy";
            kluczZagadki = "ZPORR";
            lokacjaZnacznika = new LatLng(51.745913, 19.455619);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
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
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.745371, 19.451457), 19.0));
            rozwinButtonVisibility = true;
            zamknijPanelVisibility = true;
            tekstZagadki = "W razie niebezpiecześtwa ...";
            kluczZagadki = "Zbić szybkę";
            lokacjaZnacznika = new LatLng(51.745371, 19.451457);
            funcThatMakesAsyncCall();
            zamknijPanelPolozenie = 0.8;
          }
          );
        },
        position: LatLng(51.745371, 19.451457)));
  }

  Future funcThatMakesAsyncCall() async {
    var result = await Geolocator().distanceBetween(currentLocation.latitude, currentLocation.longitude, lokacjaZnacznika.latitude, lokacjaZnacznika.longitude);
    setState(() {
      dist = result;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    Timer.run(() {
//      showDialog(
//          context: context,
//          builder: (BuildContext context) =>
//          new AlertDialog(
//            title: new Text(
//                "Witaj w grze TUL CONQUEST!\nOwiedź zakładkę 'O programie', aby poznać zasady."),
//            actions: <Widget>[
//              new FlatButton(
//                  onPressed: () {
//                    Navigator.of(context).pop();
//                  },
//                  child: new Text(
//                    'Zamknij',
//                    style: TextStyle(
//                      color: Colors.black,
//                    ),
//                  )
//              )
//            ],
//          )
//      );
//    });

  }

  @override
  Widget build(BuildContext context) {
    dodajZnacznikiDoListy(mapController, znaczniki);
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new HomeScreen());
  }
}