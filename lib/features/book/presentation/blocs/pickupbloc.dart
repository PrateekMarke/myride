import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class PickupLocationEvent {}

class SelectPickupLocation extends PickupLocationEvent {
  final String location;
  SelectPickupLocation(this.location);
}

// States
abstract class PickupLocationState {}

class PickupLocationInitial extends PickupLocationState {}

class PickupLocationSelected extends PickupLocationState {
  final String location;
  PickupLocationSelected(this.location);
}

// BLoC Class
class PickupLocationBloc extends Bloc<PickupLocationEvent, PickupLocationState> {
  PickupLocationBloc() : super(PickupLocationInitial()) {
    on<SelectPickupLocation>((event, emit) {
      emit(PickupLocationSelected(event.location));
    });
  }
}
