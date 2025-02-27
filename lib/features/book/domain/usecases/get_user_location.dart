import 'package:myride/features/book/domain/entities/location_entity.dart';
import 'package:myride/features/book/domain/repositories/location_repository.dart';


class GetUserLocation {
  final LocationRepository repository;

  GetUserLocation(this.repository);

  Future<LocationEntity?> call() {
    return repository.getUserLocation();
  }
}