import 'package:flutter/material.dart';
import 'package:myride/features/book/presentation/screens/maps/mapscreen.dart';
import 'package:myride/features/book/presentation/widgets/customTimeline.dart';

class BookRideScreen extends StatefulWidget {
  const BookRideScreen({super.key});

  @override
  State<BookRideScreen> createState() => _BookRideScreenState();
}

class _BookRideScreenState extends State<BookRideScreen> {
  TextEditingController _pickupController = TextEditingController();
  TextEditingController _dropoffController = TextEditingController();

  void _setPickupLocation(String location) {
    setState(() {
      _pickupController.text = location;
    });
  }

  void _setDropoffLocation(String location) {
    setState(() {
      _dropoffController.text = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Book Ride'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTimeline(),
            SizedBox(height: 20),
            Text('Pick-up Location:', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _pickupController,
              decoration: InputDecoration(
                hintText: 'Enter a Pickup Location',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapScreen(
                      onLocationSelected: _setPickupLocation,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Text('Drop-off Location:', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _dropoffController,
              decoration: InputDecoration(
                hintText: 'Enter a Drop Location',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapScreen(
                      onLocationSelected: _setDropoffLocation,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.grey[300],
              ),
              child: Text('Continue', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
