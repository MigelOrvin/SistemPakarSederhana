import 'package:flutter/material.dart';

class GreetingSection extends StatelessWidget {
  final String greeting;
  const GreetingSection({super.key, required this.greeting});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$greeting,",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "User",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color.fromARGB(255, 111, 111, 111).withOpacity(0.3),
              width: 2,
            ),
          ),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              size: 30,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ],
    );
  }
}
