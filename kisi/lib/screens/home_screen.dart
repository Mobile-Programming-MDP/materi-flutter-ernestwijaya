import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:kisi_kisi/screens/input_screen.dart';

class HomeScreen extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.ref("narapidana");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Narapidana")),
      body: StreamBuilder(
        stream: dbRef.onValue,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!.snapshot.value as Map?;

          if (data == null) {
            return Center(child: Text("Belum ada data"));
          }

          final items = data.entries.toList();

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index].value;

              return ListTile(
                title: Text(item['nama']),
                subtitle: Text(
                    "${item['jenis_kelamin']} | ${item['umur']} tahun\nKasus: ${item['kasus']}"),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => InputScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}