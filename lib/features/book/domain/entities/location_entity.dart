import 'package:latlong2/latlong.dart';

class LocationEntity {
  final LatLng latLng;
  final String? address;

  LocationEntity({required this.latLng, this.address});
}