import 'package:flutter/material.dart';
import 'main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 22), // lebih gede di AppBar
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Nama: Zahra Jane Arnecia',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'NIM: 4522210028',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Email: 4522210028@univpancasila.ac.id',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text(
                  'Dark Mode',
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Switch(
                  value: _isDarkMode,
                  onChanged: (bool value) {
                    setState(() {
                      _isDarkMode = value;
                      MyApp.of(context)!.toggleTheme(value);
                    });
                  },
                  activeColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
