import 'package:google_maps_flutter/google_maps_flutter.dart';

void dodajZnacznikiDoListy(GoogleMapController controller, List<Marker> znaczniki) {
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