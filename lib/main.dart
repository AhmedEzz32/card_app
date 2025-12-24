import 'package:flutter/material.dart';
import 'screens/signup_screen.dart';
import 'screens/card_screen.dart';
import 'screens/scan_screen.dart';
import 'screens/database_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Membership Card App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => RegistrationScreen(),
        '/card': (context) => CardScreen(),
        '/scan': (context) => ScanScreen(),
        '/database': (context) => DatabaseScreen(),
      },
    );
  }
}
