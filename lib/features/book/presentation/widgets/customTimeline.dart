import 'package:flutter/material.dart';

class CustomTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center, 
      children: [
        buildStep('1', 'Enter Details', isActive: true),
       
        Padding(
          padding: const EdgeInsets.fromLTRB(0,0,0,25),
          child: buildConnector(),
        ),
       
        buildStep('2', 'Choose Vehicle'),
         Padding(
          padding: const EdgeInsets.fromLTRB(0,0,0,25),
          child: buildConnector(),
        ),
        buildStep('3', 'Payment'),
         Padding(
          padding: const EdgeInsets.fromLTRB(0,0,0,25),
          child: buildConnector(),
        ),
        buildStep('4', 'Finish'),
      ],
    );
  }

  Widget buildStep(String number, String title, {bool isActive = false}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: isActive ? Colors.yellow : Colors.grey,
          child: Text(
            number,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.black : Colors.white,
            ),
          ),
        ),
       
        SizedBox(
          width: 50,
          height: 35,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            softWrap: true,
          ),
        ),
      ],
    );
  }

  Widget buildConnector() {
    return SizedBox(
      width: 37,
      height: 20,
      child:Divider(
        thickness: 3,
        color: Colors.grey,
        height: 500, 
      ),
    );
  }
}





