import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> kegiatan = [
    {'nama': 'Submit Journal', 'tanggal': 'January 7, 2025', 'selesai': true},
    {'nama': 'Work on Data Analyst Project', 'tanggal': 'April 27, 2025', 'selesai': true},
    {'nama': 'Write an Article on Medium', 'tanggal': 'May 4, 2025', 'selesai': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zahra Jane's Daily College Activities"),
      ),
      body: ListView.builder(
        itemCount: kegiatan.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: CheckboxListTile(
              title: Text(kegiatan[index]['nama']),
              subtitle: Text(kegiatan[index]['tanggal']),
              value: kegiatan[index]['selesai'],
              onChanged: (bool? value) {
                setState(() {
                  kegiatan[index]['selesai'] = value!;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
