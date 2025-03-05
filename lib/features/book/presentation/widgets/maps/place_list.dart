import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:myride/features/book/data/repositories/location_repository_impl.dart';

class PlaceListWidget extends StatelessWidget {
  final List<dynamic> placeList;
  final Function(LatLng, String) onLocationSelected;

  const PlaceListWidget({required this.placeList, required this.onLocationSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return placeList.isEmpty
        ? SizedBox.shrink()
        : Container(
            padding: EdgeInsets.all(5),
            color: Colors.white,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: placeList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(placeList[index].address),
                  onTap: () async {
                    final locationRepo = LocationRepositoryImpl();
                    final locationEntity = await locationRepo.getCoordinates(placeList[index].placeId); 

                    if (locationEntity != null) {
                      onLocationSelected(locationEntity.latLng, placeList[index].address); 
                   
                  }},
                );
              },
            ),
          );
  }
}
