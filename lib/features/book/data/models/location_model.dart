





import 'package:latlong2/latlong.dart';
import 'package:myride/features/book/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  final String placeId; // ✅ Add placeId field

  LocationModel({
    required LatLng latLng,
    String? address,
    required this.placeId, // ✅ Store placeId
  }) : super(latLng: latLng, address: address);

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      latLng: LatLng(json['lat'], json['lng']),
      address: json['address'],
      placeId: json['place_id'] ?? "", // ✅ Parse place_id from JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': latLng.latitude,
      'lng': latLng.longitude,
      'address': address,
      'place_id': placeId, // ✅ Include placeId in toJson()
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


