import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:myride/features/book/presentation/widgets/maps/search_bar.dart';

class MapScreen extends StatefulWidget {
  final Function(String) onLocationSelected;
  
  const MapScreen({super.key, required this.onLocationSelected});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  LatLng? _currentLocation;
  LatLng? _searchedLocation;
  final Location _location = Location();
  String _selectedAddress = "";

  @override
  void initState() {
    super.initState();
    _fetchUserLocation();
  }

  Future<void> _fetchUserLocation() async {
    try {
      final locationData = await _location.getLocation();
      setState(() {
        _currentLocation = LatLng(locationData.latitude!, locationData.longitude!);
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

 void _updateLocation(LatLng newLocation, String address) {
  setState(() {
    _searchedLocation = newLocation;
    _selectedAddress = address;
  });

  Future.delayed(Duration(milliseconds: 100), () {
    _mapController.move(newLocation, 15); 
  });

  widget.onLocationSelected(address);
}

  void _moveToCurrentLocation() {
    if (_currentLocation != null) {
      _mapController.move(_currentLocation!, 15);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map'), backgroundColor: Colors.yellow, centerTitle: true),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _currentLocation ?? LatLng(20.5937, 78.9629),
              initialZoom: 5,
            ),
            children: [
              TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
              CurrentLocationLayer(style: LocationMarkerStyle(markerSize: Size(35, 35))),
              if (_searchedLocation != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _searchedLocation!,
                      width: 50,
                      height: 50,
                      child: Icon(Icons.location_pin, color: Colors.red, size: 40),
                    ),
                  ],
                ),
            ],
          ),
         SearchBarWidget(
  onLocationSelected: _updateLocation,
),
          Positioned(
            bottom: 20,
            right: 15,
            child: FloatingActionButton(
              onPressed: _moveToCurrentLocation,
              child: Icon(Icons.my_location, color: Colors.white),
              backgroundColor: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
