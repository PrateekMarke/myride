import 'package:flutter/material.dart';
import 'package:myride/features/book/presentation/screens/bookDelivery.dart';
import 'package:myride/features/book/presentation/screens/bookRide.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double initialY = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Article'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(

            padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
            // child: GestureDetector(
            //   onVerticalDragDown: (details) {
            //     setState(() {
            //       initialY = details.globalPosition.dy;
            
            //       if (initialY > 100 && initialY < 250) {
            //         print("Swiped Up! Navigating to BookRide$initialY");
            //         // Navigator.push(
            //         //   context,
            //         //   MaterialPageRoute(builder: (context) => BookRide()),
            //         // );
            //       } else if (initialY > 400 && initialY < 550) {
            //         print("Swiped Down! Navigating to BookDelivery$initialY");
            //         // Navigator.push(
            //         //   context,
            //         //   MaterialPageRoute(builder: (context) => Bookdelivery()),
            //         // );
            //       }
            //     });
            //   },
              child: Column(
                children: [
                  DragTarget<int>(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return Column(
                        children: [Text(
                          'Book Ride',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_up, size: 40, color: Colors.grey),
                  Icon(Icons.keyboard_arrow_up, size: 40, color: Colors.grey),
                  Icon(Icons.keyboard_arrow_up, size: 40, color: Colors.grey),
                        ]
                      );
                    },
                    onAcceptWithDetails: (DragTargetDetails<int> details) {
                      
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookRideScreen()),
                        );
                      
                    },
                  ),
            
                  
            
                  SizedBox(height: 10),
                  Draggable<int>(
                    axis: Axis.vertical,
                    affinity: Axis.vertical,
                    data: 1,
                    childWhenDragging: SizedBox(width: 150, height: 150),
            
                    feedback: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.yellow[100],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.yellow, width: 5),
                      ),
                      child: Center(
                        child: Icon(Icons.map, size: 50, color: Colors.black),
                      ),
                    ),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.yellow[100],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.yellow, width: 5),
                      ),
                      child: Center(
                        child: Icon(Icons.map, size: 50, color: Colors.black),
                      ),
                    ),
                  ),
                  DragTarget<int>(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return Column(
                        
                        children: [Icon(Icons.keyboard_arrow_down, size: 40, color: Colors.grey),
                  Icon(Icons.keyboard_arrow_down, size: 40, color: Colors.grey),
                  Icon(Icons.keyboard_arrow_down, size: 40, color: Colors.grey),
                  Text(
                          'Book Delivery',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        
                        ] 
                      );
                    },
                    onAcceptWithDetails: (DragTargetDetails<int> details) {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Bookdelivery()),
                        );
                      });
                    },
                  ),
                ],
              ),
            
          ),
        ),
      ),
    );
  }
}
