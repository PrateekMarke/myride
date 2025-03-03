
import 'package:latlong2/latlong.dart';
import 'package:myride/features/book/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  final String placeId; 

  LocationModel({
    required LatLng latLng,
    String? address,
    required this.placeId, 
  }) : super(latLng: latLng, address: address);

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      latLng: LatLng(json['lat'], json['lng']),
      address: json['address'],
      placeId: json['place_id'] ?? "", 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': latLng.latitude,
      'lng': latLng.longitude,
      'address': address,
      'place_id': placeId, 
    };
  }
}


















// import 'package:latlong2/latlong.dart';
// import 'package:myride/features/book/domain/entities/location_entity.dart';


// class LocationModel extends LocationEntity {
//   LocationModel({required LatLng latLng, String? address})
//       : super(latLng: latLng, address: address);

//   factory LocationModel.fromJson(Map<String, dynamic> json) {
//     return LocationModel(
//       latLng: LatLng(json['lat'], json['lng']),
//       address: json['address'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {'lat': latLng.latitude, 'lng': latLng.longitude, 'address': address};
//   }
// }


