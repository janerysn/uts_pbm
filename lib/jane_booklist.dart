import 'package:flutter/material.dart';

class JaneBooklistPage extends StatefulWidget {
  const JaneBooklistPage({super.key});

  @override
  State<JaneBooklistPage> createState() => _JaneBooklistPageState();
}

class _JaneBooklistPageState extends State<JaneBooklistPage> {
  List<Map<String, dynamic>> buku = [
    {'judul': 'Atomic Habit', 'dibaca': true},
    {'judul': 'The Power of Habit', 'dibaca': false},
    {'judul': 'How to Win Friends and Influence People', 'dibaca': false},
    {'judul': 'The 7 Habits of Highly Effective People', 'dibaca': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jane's Booklist"),
      ),
      body: ListView.builder(
        itemCount: buku.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: CheckboxListTile(
              title: Text(buku[index]['judul']),
              value: buku[index]['dibaca'],
              onChanged: (bool? value) {
                setState(() {
                  buku[index]['dibaca'] = value!;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
