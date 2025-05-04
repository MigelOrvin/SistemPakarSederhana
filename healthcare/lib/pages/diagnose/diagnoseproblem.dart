import 'package:flutter/material.dart';
import 'package:healthcare/fact/factsset.dart';

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
                            .toList();

                    //penyakit sebenernyo
                    final exactMatchedDiseases =
                        diseases.where((disease) {
                          final diseaseSymptomIds =
                              disease.symptoms
                                  .map((symptom) => symptom.id)
                                  .toList();
                          return diseaseSymptomIds.every(
                                (symptomId) =>
                                    selectedSymptoms.contains(symptomId),
                              ) &&
                              selectedSymptoms.every(
                                (symptomId) =>
                                    diseaseSymptomIds.contains(symptomId),
                              );
                        }).toList();

                    //kemungkinan laen
                    final possibleDiseases =
                        diseases.where((disease) {
                          final diseaseSymptomIds =
                              disease.symptoms
                                  .map((symptom) => symptom.id)
                                  .toList();
                          final commonSymptoms = selectedSymptoms
                              .where((symptomId) =>
                                  diseaseSymptomIds.contains(symptomId))
                              .toList();
                          return commonSymptoms.length >=
                                  (diseaseSymptomIds.length * 0.75).floor() &&
                              !exactMatchedDiseases.contains(disease);
                        }).toList();

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Diagnosis Result'),
                          content: Column(
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
                                  children:
                                      exactMatchedDiseases.map((disease) {
                                        return Text("${disease.name}");
                                      }).toList(),
                                ),
                                const SizedBox(height: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "But there's other posibilities: ${possibleDiseases.length}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ] else if (possibleDiseases.isNotEmpty) ...[
                                const Text(
                                  "Your problem maybe this:",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                      possibleDiseases.map((disease) {
                                        return Text("${disease.name}");
                                      }).toList(),
                                ),
                              ],
                            ],
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
                            if (exactMatchedDiseases.isNotEmpty)
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
