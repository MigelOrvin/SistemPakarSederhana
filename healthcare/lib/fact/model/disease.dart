import 'package:healthcare/fact/model/symptom.dart';

class Disease {
  final String name;
  final List<Symptom> symptoms;

  Disease({required this.name, required this.symptoms});
}