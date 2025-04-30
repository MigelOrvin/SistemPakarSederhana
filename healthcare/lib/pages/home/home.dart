import 'package:flutter/material.dart';
import 'package:healthcare/pages/home/widgetsHome/diagnose.dart';
import 'package:healthcare/pages/home/widgetsHome/greeting.dart';
import 'package:healthcare/pages/home/widgetsHome/information.dart';
import 'package:intl/intl.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d MMMM').format(DateTime.now());
    String greeting;
    int hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      greeting = "Good morning";
    } else if (hour >= 12 && hour < 18) {
      greeting = "Good afternoon";
    } else {
      greeting = "Good night";
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(244, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "Today, $formattedDate",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            Color.fromARGB(174, 181, 181, 181)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GreetingSection(greeting: greeting),
              SizedBox(height: 10),
              Text(
                "have problem? lets check it out!",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              SizedBox(height: 30),
              DiagnoseCard(),
              SizedBox(height: 50),
              Text(
                "Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "More information about disease",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              SizedBox(height: 10),
              InformationDisease()
            ],
          ),
        ),
      ),
    );
  }
}
