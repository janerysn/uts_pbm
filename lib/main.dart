import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'home.dart';
import 'jadwal_kuliah.dart';
import 'profile.dart';
import 'jane_booklist.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(), // jalankan MyApp di dalam DevicePreview
    ),
  );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptif App',
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true, // penting supaya DevicePreview jalan
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFECEBDE),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFA59D84),
          foregroundColor: Colors.white,
        ),
        cardColor: const Color(0xFFD7D3BF),
        colorScheme: ColorScheme.light(
          primary: Color(0xFFA59D84),
          secondary: Color(0xFFC1BAA1),
          background: Color(0xFFECEBDE),
          surface: Color(0xFFD7D3BF),
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onBackground: Colors.black,
          onSurface: Colors.black,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
          bodyLarge: TextStyle(color: Colors.black),
          titleMedium: TextStyle(color: Colors.black),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(Color(0xFFA59D84)),
        ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: const MainPage(),
    );
  }

}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const JadwalPage(),
    const ProfilePage(),
    const JaneBooklistPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      selectedIndex: selectedIndex,
      onSelectedIndexChange: (int index) {
        setState(() {
          selectedIndex = index;
        });
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.schedule), label: 'Schedule'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        NavigationDestination(icon: Icon(Icons.book), label: 'Books'),
      ],
      body: (_) => pages[selectedIndex],
    );
  }
}
