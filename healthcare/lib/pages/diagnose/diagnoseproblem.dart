import 'package:flutter/material.dart';
import 'package:healthcare/fact/factsset.dart';
import 'package:healthcare/fact/model/disease.dart';

class DiagnoseProblem extends StatefulWidget {
  const DiagnoseProblem({super.key});

  @override
  State<DiagnoseProblem> createState() => _DiagnoseProblemState();
}

class _DiagnoseProblemState extends State<DiagnoseProblem> {
  final Map<int, bool> _selectedSymptoms = {};

  @override
  void initState() {
    super.initState();
    for (var symptom in symptoms) {
      _selectedSymptoms[symptom.id] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Diagnose Problem',
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
          gradient: LinearGradient(
            colors: [Colors.white, Color.fromARGB(174, 181, 181, 181)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Check Your Symptoms',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Select the symptoms you are experiencing:',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children:
                          symptoms.map((symptom) {
                            return CheckboxListTile(
                              title: Text(symptom.name),
                              value: _selectedSymptoms[symptom.id],
                              onChanged: (bool? value) {
                                setState(() {
                                  _selectedSymptoms[symptom.id] =
                                      value ?? false;
                                });
                              },
                              activeColor: Colors.blue,
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    final selectedSymptoms =
                        _selectedSymptoms.entries
                            .where((entry) => entry.value)
                            .map((entry) => entry.key)
                            .toSet();

                    final exactMatchedDiseases =
                        diseases.where((disease) {
                          final diseaseSymptomIds =
                              disease.symptoms
                                  .map((symptom) => symptom.id)
                                  .toSet();
                          return diseaseSymptomIds
                                  .difference(selectedSymptoms)
                                  .isEmpty &&
                              selectedSymptoms
                                  .difference(diseaseSymptomIds)
                                  .isEmpty;
                        }).toList();

                    final possibleDiseases =
                        diseases
                            .map((disease) {
                              final diseaseSymptomIds =
                                  disease.symptoms
                                      .map((symptom) => symptom.id)
                                      .toSet();
                              final commonSymptoms = diseaseSymptomIds
                                  .intersection(selectedSymptoms);

                              double probability =
                                  commonSymptoms.length /
                                  diseaseSymptomIds.length;

                              if (selectedSymptoms.length >
                                  diseaseSymptomIds.length) {
                                final extraSymptoms =
                                    selectedSymptoms.length -
                                    diseaseSymptomIds.length;
                                probability -=
                                    (extraSymptoms / diseaseSymptomIds.length);
                                if (probability < 0) probability = 0;
                              }

                              return {
                                'disease': disease,
                                'probability': probability,
                              };
                            })
                            .where(
                              (entry) => (entry['probability'] as double) > 0,
                            )
                            .toList()
                          ..sort(
                            (a, b) => (b['probability'] as double).compareTo(
                              a['probability'] as double,
                            ),
                          );

                    final possibleDiseasesFiltered =
                        selectedSymptoms.length < 3
                            ? diseases.where((disease) {
                              final diseaseSymptomIds =
                                  disease.symptoms
                                      .map((symptom) => symptom.id)
                                      .toSet();
                              final commonSymptoms = diseaseSymptomIds
                                  .intersection(selectedSymptoms);
                              return commonSymptoms.isNotEmpty &&
                                  !exactMatchedDiseases.contains(disease);
                            }).toList()
                            : possibleDiseases.isNotEmpty
                            ? possibleDiseases
                                .where(
                                  (entry) =>
                                      entry['probability'] ==
                                      possibleDiseases.first['probability'],
                                )
                                .map((entry) => entry['disease'] as Disease)
                                .toList()
                            : [];

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Diagnosis Result'),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (exactMatchedDiseases.isNotEmpty) ...[
                                  const Text(
                                    "This is your diseases:",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: exactMatchedDiseases.map((disease) {
                                      return Container(
                                        margin: const EdgeInsets.only(bottom: 5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                disease.name,
                                                style: const TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: const Text(
                                                "100%",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  const SizedBox(height: 16),
                                  if (possibleDiseasesFiltered.length > 1)
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "But there's other possibilities: ${possibleDiseasesFiltered.length - 1}\nIf you have more symptoms, add them to the list.",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                ] else if (possibleDiseasesFiltered.isNotEmpty) ...[
                                  const Text(
                                    "Your problem are this:",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: possibleDiseasesFiltered.map((disease) {
                                      final diseaseEntry = possibleDiseases.firstWhere(
                                        (entry) => entry['disease'] == disease,
                                        orElse: () => {'disease': disease, 'probability': 0.0},
                                      );
                                      final probability = (diseaseEntry['probability'] as double) * 100;
                                      
                                      return Container(
                                        margin: const EdgeInsets.only(bottom: 5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                disease.name,
                                                style: const TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                              decoration: BoxDecoration(
                                                color: probability > 75 ? Colors.green : 
                                                      probability > 50 ? Colors.orange : 
                                                      Colors.red,
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Text(
                                                "${probability.toStringAsFixed(0)}%",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Choose Again',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            if (exactMatchedDiseases.isNotEmpty || possibleDiseasesFiltered.isNotEmpty)
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedSymptoms.updateAll(
                                      (key, value) => false,
                                    );
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'OK',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

