import 'package:flutter/material.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> jadwal = [
      {'hari': 'Monday', 'mataKuliah': 'Big Data Analysis'},
      {'hari': 'Tuesday', 'mataKuliah': 'Metodelogi Penelitian'},
      {'hari': 'Wednesday', 'mataKuliah': 'Manajemen Proyek'},
      {'hari': 'Thursday', 'mataKuliah': 'Pengantar Data Science'},
      {'hari': 'Friday', 'mataKuliah': 'Geoinformatika'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Class Schedule"),
      ),
      body: ListView.builder(
        itemCount: jadwal.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(jadwal[index]['hari']!),
              subtitle: Text(jadwal[index]['mataKuliah']!),
            ),
          );
        },
      ),
    );
  }
}
