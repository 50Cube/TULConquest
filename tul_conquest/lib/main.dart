import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tul_conquest/markers.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';

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
        markerId: MarkerId('fitfabric'),
        draggable: false,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747000, 19.451992), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Dyscyplina sportu";
            kluczZagadki = "Squash";
            lokacjaZnacznika = new LatLng(51.747000, 19.451992);
            funcThatMakesAsyncCall();
          });
        },
        position: LatLng(51.747000, 19.451992)));
    znaczniki.add(Marker(
        markerId: MarkerId('galanz'),
        draggable: false,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747344, 19.455063), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "_lan_";
            kluczZagadki = "Gaz";
            lokacjaZnacznika = new LatLng(51.747344, 19.455063);
            funcThatMakesAsyncCall();
          });
        },
        position: LatLng(51.747344, 19.455063)));
    znaczniki.add(Marker(
        markerId: MarkerId('Zegarek'),
        draggable: false,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.745060, 19.453975), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Która godzina?\n\n(Wprowadź godzinę w formacie hh:mm)";
            kluczZagadki = "12:10";
            lokacjaZnacznika = new LatLng(51.745060, 19.453975);
            funcThatMakesAsyncCall();
          });
        },
        position: LatLng(51.745060, 19.453975)));
    znaczniki.add(Marker(
        markerId: MarkerId('Klodka'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng( 51.747794, 19.454366), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Data na kłódce";
            kluczZagadki = "20.03";
            lokacjaZnacznika = new LatLng(51.747794, 19.454366);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng( 51.747794, 19.454366)));
    znaczniki.add(Marker(
        markerId: MarkerId('Posag'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng( 51.746690, 19.453912), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Nazwisko rektora PŁ";
            kluczZagadki = "Krysiński";
            lokacjaZnacznika = new LatLng(51.746690, 19.453912);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng( 51.746690, 19.453912)));
    znaczniki.add(Marker(
        markerId: MarkerId('Dziekanat'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.747465, 19.455995), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Dziekanat ... Logistyki";
            kluczZagadki = "Kolegium";
            lokacjaZnacznika = new LatLng(51.747465, 19.455995);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(  51.747465, 19.455995)));
    znaczniki.add(Marker(
        markerId: MarkerId('Budownictwo'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.747634, 19.451893), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Ilość tabliczek:";
            kluczZagadki = "9";
            lokacjaZnacznika = new LatLng(51.747634, 19.451893);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(  51.747634, 19.451893)));
    znaczniki.add(Marker(
        markerId: MarkerId('Dzial transferu technologi'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.748952, 19.454690), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Jaka administracja?";
            kluczZagadki = "Rektorska";
            lokacjaZnacznika = new LatLng(51.748952, 19.454690);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(  51.748952, 19.454690)));
    znaczniki.add(Marker(
        markerId: MarkerId('Rektorat PL'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(   51.748810, 19.455350), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Kto był właścicielem willi?";
            kluczZagadki = "Reinhold Richter";
            lokacjaZnacznika = new LatLng(51.748810, 19.455350);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(   51.748810, 19.455350)));
    znaczniki.add(Marker(
        markerId: MarkerId('szambo'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.747708, 19.453324), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Rok";
            kluczZagadki = "1558";
            lokacjaZnacznika = new LatLng(51.747708, 19.453324);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(   51.747708, 19.453324)));
    znaczniki.add(Marker(
        markerId: MarkerId('Rozdzielnia'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(   51.746909, 19.456282), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Ile V?";
            kluczZagadki = "400";
            lokacjaZnacznika = new LatLng(51.746909, 19.456282);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(    51.746909,19.456282)));
    znaczniki.add(Marker(
        markerId: MarkerId('CTI'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(   51.747198, 19.456007), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Wersja dydaktyki";
            kluczZagadki = "2.0";
            lokacjaZnacznika = new LatLng(51.747198, 19.456007);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng( 51.747198,19.456007)));
    znaczniki.add(Marker(
        markerId: MarkerId('BudynekBPokoj15'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(    51.746465, 19.455791), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Numer budynku";
            kluczZagadki = "B15";
            lokacjaZnacznika = new LatLng(51.746465, 19.455791);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(  51.746465,19.455791)));
    znaczniki.add(Marker(
        markerId: MarkerId('BudynekBPokoj14'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.746409,19.455395), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Kto chroni obiekt?";
            kluczZagadki = "Magnum";
            lokacjaZnacznika = new LatLng(51.746409, 19.455395);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(  51.746409,19.455395)));
    znaczniki.add(Marker(
        markerId: MarkerId('drogowskazybiblio'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.745674,19.455323), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Liczba drogowskazów";
            kluczZagadki = "6";
            lokacjaZnacznika = new LatLng(51.745674, 19.455323);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(   51.745674,19.455323)));
    znaczniki.add(Marker(
        markerId: MarkerId('b8regulaminwyjazd'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.747571,19.450931), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Telefon do Dowódcy Straży Politechniki Łódzkiej";
            kluczZagadki = "631 29 07";
            lokacjaZnacznika = new LatLng(51.747571, 19.450931);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(  51.747571,19.450931)));
    znaczniki.add(Marker(
        markerId: MarkerId('Kropka'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747704,19.452855), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Kto zaprasza na zakupy?";
            kluczZagadki = "Kropka";
            lokacjaZnacznika = new LatLng(51.747704, 19.452855);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(51.747704,19.452855)));
    znaczniki.add(Marker(
        markerId: MarkerId('drukA4'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.747965,19.451947), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Największy format druku";
            kluczZagadki = "A0";
            lokacjaZnacznika = new LatLng(51.747965, 19.451947);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(  51.747965,19.451947)));
    znaczniki.add(Marker(
        markerId: MarkerId('szlabanWyjazd'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng( 51.747796, 19.450893), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Opłata za zgubiony bilet";
            kluczZagadki = "50";
            lokacjaZnacznika = new LatLng(51.747796, 19.450893);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng( 51.747796, 19.450893)));
    znaczniki.add(Marker(
        markerId: MarkerId('bezLipy'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng( 51.748666, 19.453617), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Bez";
            kluczZagadki = "Lipy";
            lokacjaZnacznika = new LatLng(51.748666, 19.453617);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng( 51.748666, 19.453617)));
    znaczniki.add(Marker(
        markerId: MarkerId('pomnikNatury'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng( 51.748359, 19.455163), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Podstawa bryły tworzonej przez podpory drzewa to:";
            kluczZagadki = "Trójkąt";
            lokacjaZnacznika = new LatLng(51.748359, 19.455163);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng( 51.748359, 19.455163)));
    znaczniki.add(Marker(
        markerId: MarkerId('Instytut przeplywowy'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng( 51.746696, 19.454084), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Adres URL instytutu:";
            kluczZagadki = "www.imp.p.lodz.pl";
            lokacjaZnacznika = new LatLng(51.746696, 19.454084);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(51.746408, 19.455676)));
    znaczniki.add(Marker(
        markerId: MarkerId('wjazdodwolczanskiej5m'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.748300, 19.456389), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Bezpieczny dystans";
            kluczZagadki = "5m";
            lokacjaZnacznika = new LatLng(51.748300, 19.456389);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng( 51.748300, 19.456389)));
    znaczniki.add(Marker(
        markerId: MarkerId('rainbowtours'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(  51.748921,  19.456253), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Znajdź tęczę";
            kluczZagadki = "Rainbow";
            lokacjaZnacznika = new LatLng(51.748921, 19.456253);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng( 51.748921,  19.456253)));
    znaczniki.add(Marker(
        markerId: MarkerId('papiernictwo'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.746006, 19.454548), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Instytut papiernictwa i ... Politechniki Łódzkiej";
            kluczZagadki = "Poligrafii";
            lokacjaZnacznika = new LatLng(51.746006, 19.454548);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(51.746006, 19.454548)));
    znaczniki.add(Marker(
        markerId: MarkerId('posagwlesie'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.748593, 19.453803), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Idzie zima";
            kluczZagadki = "Załóż czapkę";
            lokacjaZnacznika = new LatLng(51.748593, 19.453803);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(51.748593, 19.453803)));
    znaczniki.add(Marker(
        markerId: MarkerId('przywyjezdzie na wolczanska'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.746099, 19.456230), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Ilość słów";
            kluczZagadki = "8";
            lokacjaZnacznika = new LatLng(51.746099, 19.456230);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(51.746099, 19.456230)));
    znaczniki.add(Marker(
        markerId: MarkerId('przybiblotece'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.745681, 19.453580), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Ilość kafelków w drzwiach";
            kluczZagadki = "24";
            lokacjaZnacznika = new LatLng(51.745681, 19.453580);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(51.745681, 19.453580)));
    znaczniki.add(Marker(
        markerId: MarkerId('nfz'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747209, 19.455656), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Ile godzin dziennie czynne";
            kluczZagadki = "10";
            lokacjaZnacznika = new LatLng(51.747209, 19.455656);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(51.747209, 19.455656)));
    znaczniki.add(Marker(
        markerId: MarkerId('przylodexie'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.747127, 19.453993), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Rok:";
            kluczZagadki = "2004";
            lokacjaZnacznika = new LatLng(51.747127, 19.453993);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(51.747127, 19.453993)));
    znaczniki.add(Marker(
        markerId: MarkerId('zporr'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.745913, 19.455619), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "Skrót na tablicy";
            kluczZagadki = "ZPORR";
            lokacjaZnacznika = new LatLng(51.745913, 19.455619);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(51.745913, 19.455619)));
    znaczniki.add(Marker(
        markerId: MarkerId('cj'),
        draggable: false,

        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          setState(() {
            controller.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(51.745371, 19.451457), 19.0));
            rozwinButtonVisibility = !rozwinButtonVisibility;
            tekstZagadki = "W razie niebezpiecześtwa ...";
            kluczZagadki = "Zbić szybkę";
            lokacjaZnacznika = new LatLng(51.745371, 19.451457);
            funcThatMakesAsyncCall();
          }
          );
        },
        position: LatLng(51.745371, 19.451457)));
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
  bool textFieldVisibility = false;

  String tekstZagadki = "Kwestionariusz";
  String kluczZagadki = "HeRb";
  bool tekstZagadkiVisibility = false;

  LatLng lokacjaZnacznika = new LatLng(0, 0);

  Location location = Location();
  LocationData currentLocation;


  double dist = 0;
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
                zoom: 18.0,
              ),
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              mapType: mapType,
              markers: Set.from(znaczniki),
            ),
          ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    child:
                  Text("Location" + dist.toString())
                )
              ),
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
//                                decoration: BoxDecoration(
//                                  border: Border.all(width: 0.5, color: Colors.black),
//                                  borderRadius: BorderRadius.circular(10.0)
//                                ),
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
                                    decoration: InputDecoration(
                                      hintText: 'Wpisz odpowiedź',
                                    ),
                                  )
                              ))),

                          GestureDetector(         // SPRAWDZ
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
                                  textFieldVisibility = true;
                                  tekstZagadkiVisibility = true;
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
