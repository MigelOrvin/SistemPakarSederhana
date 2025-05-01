import 'package:flutter/material.dart';
import 'package:healthcare/fact/factsset.dart';

class DiseaseDetailPage extends StatelessWidget {
  final int index;

  const DiseaseDetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final disease = diseases[index];

    return Scaffold(
      appBar: AppBar(
        title: Text(disease.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blueAccent.withOpacity(0.1),
              width: double.infinity,
              child: Icon(
                Icons.local_hospital,
                color: Colors.blue[300],
                size: 60,
              ),
            ),

            Text(
              "Nama Penyakit:",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              disease.name,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              "Gejala:",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: disease.symptoms.length,
                itemBuilder: (context, symptomIndex) {
                  final symptom = disease.symptoms[symptomIndex];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 8,
                          color: Colors.black54,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          symptom.name,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}