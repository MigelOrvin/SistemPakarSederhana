import 'package:flutter/material.dart';

class DiagnoseCard extends StatelessWidget {
  const DiagnoseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap: () {
                
              },
              child: Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    children: [
                      Icon(
                        Icons.medical_services,
                        size: 60,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Diagnose THT",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Check your health problem",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.white,
                      ),
                      
                    ],
                  ),
                ),  
              ),
            );
  }
}