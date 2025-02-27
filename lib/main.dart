import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myride/features/book/data/repositories/location_repository_impl.dart';
import 'package:myride/features/book/domain/usecases/get_user_location.dart';
import 'package:myride/features/book/presentation/blocs/location_bloc.dart';
import 'package:myride/features/book/presentation/screens/home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationBloc(getUserLocation: GetUserLocation(LocationRepositoryImpl())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, home: HomeScreen()
      ),
    );
  }
}