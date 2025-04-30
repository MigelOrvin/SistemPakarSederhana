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
            Text(
              disease.symptoms.map((s) => s.name).join(", "),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}