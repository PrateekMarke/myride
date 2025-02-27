import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class testingM extends StatefulWidget {
  const testingM({super.key});

  @override
  State<testingM> createState() => _testingMState();
}

class _testingMState extends State<testingM> {
  final Location _locationController = Location();
   final MapController _mapController = MapController();
  LatLng? _currentP;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationupdate();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'), backgroundColor: Colors.yellow, centerTitle: true
        
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _currentP ?? LatLng(20.5937, 78.9629),
              initialZoom: 13,
            ),
            children: [
              TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
              CurrentLocationLayer(style: LocationMarkerStyle(markerSize: Size(35, 35))),
            
            ],
          ),
         
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => getLocationupdate(),
        backgroundColor: Colors.amber,
        child: Icon(Icons.my_location, size: 30, color: Colors.white),
      ),
    );

  }
    Future<void> getLocationupdate() async{
      bool serviceEnabled;
      PermissionStatus permissionGranted;

      serviceEnabled = await _locationController.serviceEnabled();
      if (serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
      
      }
      else{
        return;
      }
      permissionGranted = await _locationController.hasPermission();
      if (permissionGranted == PermissionStatus.denied ) {
        permissionGranted = await _locationController.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
        
      }
      _locationController.onLocationChanged.listen((LocationData currentLocation){
        if (currentLocation.latitude != null && currentLocation.longitude != null) {
          setState(() {
            _currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
          });
        }
      });
    }
}