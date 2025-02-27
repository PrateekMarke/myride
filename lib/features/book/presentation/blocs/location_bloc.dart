import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myride/features/book/domain/usecases/get_user_location.dart';
import 'package:myride/features/book/presentation/blocs/location_event.dart';
import 'package:myride/features/book/presentation/blocs/location_state.dart';


class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetUserLocation getUserLocation;

  LocationBloc({required this.getUserLocation}) : super(LocationInitial()) {
    on<FetchUserLocation>((event, emit) async {
      emit(LocationLoading());
      final location = await getUserLocation();
      if (location != null) {
        emit(LocationLoaded(location));
      } else {
        emit(LocationError("Could not fetch location"));
      }
    });
  }
}