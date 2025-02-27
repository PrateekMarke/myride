import 'package:equatable/equatable.dart';
import 'package:myride/features/book/domain/entities/location_entity.dart';

abstract class LocationState extends Equatable {
  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final LocationEntity location;
  LocationLoaded(this.location);

  @override
  List<Object> get props => [location];
}

class LocationError extends LocationState {
  final String message;
  LocationError(this.message);

  @override
  List<Object> get props => [message];
}