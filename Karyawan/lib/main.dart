import 'package:flutter/material.dart';
import 'package:tugas_pab2/models/karyawan.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  final Karyawan karyawan;
  const MainApp({super.key, required this.karyawan});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(karyawan: karyawan),
    );
  }
}
