import 'package:flutter/material.dart';
import 'package:myride/features/book/data/repositories/location_repository_impl.dart';
import 'package:latlong2/latlong.dart';
import 'package:myride/features/book/domain/entities/location_entity.dart';
import 'place_list.dart';

class SearchBarWidget extends StatefulWidget {
  final Function(LatLng, String) onLocationSelected;

  const SearchBarWidget({required this.onLocationSelected, super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();
  final LocationRepositoryImpl _locationRepo = LocationRepositoryImpl();
  List<LocationEntity> _placeList = [];

  void _onSearchChanged() async {
    if (_controller.text.isNotEmpty) {
      List<LocationEntity> results = await _locationRepo.getSuggestions(_controller.text);
      
      if (!mounted) return; 
      
      setState(() {
        _placeList = results;
      });
    } else {
      if (!mounted) return; 
      setState(() {
        _placeList = [];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onSearchChanged);
    _controller.dispose(); 
    super.dispose();
  }

  void _selectLocation(LatLng location, String address) {
    if (!mounted) return; 

    setState(() {
      _controller.text = address;
      _placeList = [];
    });

    widget.onLocationSelected(location, address);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 10,
      right: 10,
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Search for a location',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              suffixIcon: IconButton(
                icon: Icon(Icons.cancel, color: Colors.grey),
                onPressed: () {
                  _controller.clear();
                  setState(() => _placeList = []);
                },
              ),
            ),
          ),
          PlaceListWidget(
            placeList: _placeList,
            onLocationSelected: _selectLocation,
          ),
        ],
      ),
    );
  }
}
