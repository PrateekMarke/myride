import 'package:myride/features/book/domain/entities/location_entity.dart';

abstract class LocationRepository {
  Future<LocationEntity?> getUserLocation();
  Future<List<LocationEntity>> getSuggestions(String query);
  Future<LocationEntity?> getCoordinates(String placeId);
}