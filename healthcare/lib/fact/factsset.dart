import 'package:healthcare/fact/model/disease.dart';
import 'package:healthcare/fact/model/symptom.dart';


final List<Symptom> symptoms = [
  Symptom(id: 1, name: "demam"),
  Symptom(id: 2, name: "sakit kepala"),
  Symptom(id: 3, name: "nyeri saat bicara atau menelan"),
  Symptom(id: 4, name: "batuk"),
  Symptom(id: 5, name: "hidung tersumbat"),
  Symptom(id: 6, name: "nyeri telinga"),
  Symptom(id: 7, name: "nyeri tenggorokan"),
  Symptom(id: 8, name: "hidung meler"),
  Symptom(id: 9, name: "letih dan lesu"),
  Symptom(id: 10, name: "mual dan muntah"),
  Symptom(id: 11, name: "selaput lendir merah dan bengkak"),
  Symptom(id: 12, name: "ada benjolan di leher"),
  Symptom(id: 13, name: "nyeri leher"),
  Symptom(id: 14, name: "pembengkakan kelenjar getah bening"),
  Symptom(id: 15, name: "pendarahan hidung"),
  Symptom(id: 16, name: "suara serak"),
  Symptom(id: 17, name: "bola mata bergerak tanpa sadar"),
  Symptom(id: 18, name: "dahi sakit"),
  Symptom(id: 19, name: "leher bengkak"),
  Symptom(id: 20, name: "tuli"),
  Symptom(id: 21, name: "ada yang tumbuh di mulut"),
  Symptom(id: 22, name: "air liur menetes"),
  Symptom(id: 23, name: "berat badan turun"),
  Symptom(id: 24, name: "bunyi nafas abnormal"),
  Symptom(id: 25, name: "infeksi sinus"),
  Symptom(id: 26, name: "nyeri antara mata"),
  Symptom(id: 27, name: "nyeri pinggir hidung"),
  Symptom(id: 28, name: "nyeri pipi di bawah mata"),
  Symptom(id: 29, name: "nyeri wajah"),
  Symptom(id: 30, name: "perubahan kulit"),
  Symptom(id: 31, name: "perubahan suara"),
  Symptom(id: 32, name: "radang gendang telinga"),
  Symptom(id: 33, name: "sakit gigi"),
  Symptom(id: 34, name: "serangan vertigo"),
  Symptom(id: 35, name: "telinga berdenging"),
  Symptom(id: 36, name: "telinga terasa penuh"),
  Symptom(id: 37, name: "tenggorokan gatal"),
  Symptom(id: 38, name: "tubuh tak seimbang"),
];



final List<Disease> diseases = [
  Disease(
    name: "CONTRACT ULCERS",
    symptoms: symptoms.where((s) => [3, 16].contains(s.id)).toList(),
  ),
  Disease(
    name: "ABAES PARAFARINGEAL",
    symptoms: symptoms.where((s) => [3, 19].contains(s.id)).toList(),
  ),
  Disease(
    name: "ABAES PERITONAILER",
    symptoms: symptoms.where((s) => [1, 2, 7, 14, 16, 22].contains(s.id)).toList(),
  ),
  Disease(
    name: "BAROTITIS MEDIA",
    symptoms: symptoms.where((s) => [2, 6].contains(s.id)).toList(),
  ),
  Disease(
    name: "DEVIASI SEPTUM",
    symptoms: symptoms.where((s) => [1, 5, 6, 15, 25, 29].contains(s.id)).toList(),
  ),
  Disease(
    name: "FARINGITIS",
    symptoms: symptoms.where((s) => [1, 3, 7, 13, 14].contains(s.id)).toList(),
  ),
  Disease(
    name: "KANKER LARING",
    symptoms: symptoms.where((s) => [3, 4, 7, 13, 16, 23, 24].contains(s.id)).toList(),
  ),
  Disease(
    name: "KANKER LEHER DAN KEPALA",
    symptoms: symptoms.where((s) => [3, 12, 15, 21, 30, 31].contains(s.id)).toList(),
  ),
  Disease(
    name: "KANKER LEHER METASTATIK",
    symptoms: symptoms.where((s) => [12].contains(s.id)).toList(),
  ),
  Disease(
    name: "KANKER NASOFARING",
    symptoms: symptoms.where((s) => [5, 15].contains(s.id)).toList(),
  ),
  Disease(
    name: "KANKER TONSIL",
    symptoms: symptoms.where((s) => [7, 12].contains(s.id)).toList(),
  ),
  Disease(
    name: "LARINGITIS",
    symptoms: symptoms.where((s) => [1, 3, 14, 19, 37].contains(s.id)).toList(),
  ),
  Disease(
    name: "NEURONITIS VESTIBULARIS",
    symptoms: symptoms.where((s) => [10, 17].contains(s.id)).toList(),
  ),
  Disease(
    name: "OSTEOSKLEROSIS",
    symptoms: symptoms.where((s) => [20, 35].contains(s.id)).toList(),
  ),
  Disease(
    name: "OTITIS MEDIA AKUT",
    symptoms: symptoms.where((s) => [1, 6, 10, 32].contains(s.id)).toList(),
  ),
  Disease(
    name: "MENIERE",
    symptoms: symptoms.where((s) => [6, 10, 34, 36].contains(s.id)).toList(),
  ),
  Disease(
    name: "TONSILITIS",
    symptoms: symptoms.where((s) => [1, 2, 3, 4, 7, 10].contains(s.id)).toList(),
  ),
  Disease(
    name: "TUMOR SYARAF PENDENGARAN",
    symptoms: symptoms.where((s) => [2, 20, 38].contains(s.id)).toList(),
  ),
  Disease(
    name: "VERTIGO POSTULAR",
    symptoms: symptoms.where((s) => [17].contains(s.id)).toList(),
  ),
  Disease(
    name: "SINUSITIS MAKSILARIS",
    symptoms: symptoms.where((s) => [1, 2, 4, 5, 8, 9, 11, 18, 28, 33].contains(s.id)).toList(),
  ),
  Disease(
    name: "SINUSITIS FRONTALIS",
    symptoms: symptoms.where((s) => [1, 2, 4, 5, 8, 9, 11].contains(s.id)).toList(),
  ),
  Disease(
    name: "SINUSITIS ETMOIDALIS",
    symptoms: symptoms.where((s) => [1, 2, 4, 5, 8, 9, 11, 18, 26, 27].contains(s.id)).toList(),
  ),
  Disease(
    name: "SINUSITIS SFENOIDALIS",
    symptoms: symptoms.where((s) => [1, 2, 4, 5, 8, 9, 11, 18].contains(s.id)).toList(),
  ),
  Disease(
    name: "PERUT",
    symptoms: symptoms.where((s) => [1, 2, 3, 4].contains(s.id)).toList(),
  ),
];