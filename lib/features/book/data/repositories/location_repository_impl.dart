import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:myride/features/book/data/models/location_model.dart';
import 'package:myride/features/book/domain/entities/location_entity.dart';
import 'package:myride/features/book/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  static const String API_KEY = "AlzaSy-83rzzbGoa53wRY-TSHwZppn7METINP1C";
  static const String BASE_URL = "https://maps.gomaps.pro/maps/api/place/autocomplete/json";
  static const String DETAILS_URL = "https://maps.gomaps.pro/maps/api/place/details/json";

  final Location _location = Location();

  @override
  Future<LocationEntity?> getUserLocation() async {
    final locationData = await _location.getLocation();
    if (locationData.latitude != null && locationData.longitude != null) {
      return LocationModel(
        latLng: LatLng(locationData.latitude!, locationData.longitude!),
        address: "Current Location", // ✅ Default value
        placeId: "", // ✅ Empty placeId for current location
      );
    }
    return null;
  }

  @override
  Future<List<LocationEntity>> getSuggestions(String query) async {
    final response = await http.get(Uri.parse("$BASE_URL?input=$query&key=$API_KEY"));
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['predictions'] as List)
          .map((e) => LocationModel(
                latLng: LatLng(0, 0), // Placeholder LatLng (coordinates fetched later)
                address: e['description'],
                placeId: e['place_id'], // ✅ Store place_id
              ))
          .toList();
    }
    return [];
  }

  @override
  Future<LocationEntity?> getCoordinates(String placeId) async {
    final response = await http.get(Uri.parse("$DETAILS_URL?place_id=$placeId&key=$API_KEY"));
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return LocationModel(
        latLng: LatLng(
          data['result']['geometry']['location']['lat'],
          data['result']['geometry']['location']['lng'],
        ),
        address: data['result']['formatted_address'], // ✅ Get full address
        placeId: placeId, // ✅ Store placeId
      );
    }
    return null;
  }
}
