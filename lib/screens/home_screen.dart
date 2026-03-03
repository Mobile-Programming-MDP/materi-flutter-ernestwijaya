import 'package:flutter/material.dart';
import 'package:tugas_pab2/models/karyawan.dart';

class HomeScreen extends StatefulWidget {
  final Karyawan karyawan;

  const HomeScreen({super.key, required this.karyawan});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Karyawan'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${widget.karyawan.nama}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Umur: ${widget.karyawan.umur}'),
                      Text('Alamat: ${widget.karyawan.alamat}'),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
      
    );
  }
}