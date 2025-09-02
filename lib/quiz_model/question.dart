import 'package:quizz_app/quiz_model/quiz_data.dart';

const question = [
  QuizData(
    "Bahasa pemrograman utama yang digunakan untuk membuat aplikasi Flutter adalah...",
    ["Dart", "Kotlin", "Swift", "Java", "C++"],
  ),
  QuizData(
    "Widget root yang biasanya digunakan pada aplikasi Flutter adalah...",
    ["MaterialApp", "Column", "Row", "Container", "ListView"],
  ),
  QuizData(
    "Fitur Flutter yang memungkinkan perubahan kode langsung terlihat tanpa restart penuh adalah...",
    [
      "Hot Reload",
      "Fast Compile",
      "Quick Build",
      "Instant Restart",
      "Live Preview",
    ],
  ),
  QuizData(
    "Widget yang digunakan untuk menampilkan daftar panjang secara scrollable adalah...",
    ["ListView", "Row", "Column", "Container", "AppBar"],
  ),
  QuizData("Properti untuk mengatur warna utama di MaterialApp adalah...", [
    "primarySwatch",
    "primaryColor",
    "backgroundColor",
    "accentColor",
    "themeMode",
  ]),
  QuizData(
    "Widget yang digunakan untuk menumpuk widget secara berlapis adalah...",
    ["Stack", "Row", "Column", "Container", "ListTile"],
  ),
  QuizData(
    "Method Navigator yang digunakan untuk kembali ke halaman sebelumnya adalah...",
    [
      "Navigator.pop()",
      "Navigator.push()",
      "Navigator.replace()",
      "Navigator.clear()",
      "Navigator.pushReplacement()",
    ],
  ),
  QuizData("Widget yang dapat memiliki state (data yang berubah) adalah...", [
    "StatefulWidget",
    "StatelessWidget",
    "InheritedWidget",
    "Container",
    "Scaffold",
  ]),
  QuizData("Properti Scaffold untuk menampilkan tombol melayang adalah...", [
    "floatingActionButton",
    "appBar",
    "body",
    "drawer",
    "bottomNavigationBar",
  ]),
  QuizData("Untuk memberi padding di sekitar widget digunakan class...", [
    "Padding",
    "Margin",
    "Border",
    "EdgeInsets",
    "SizedBox",
  ]),
];
