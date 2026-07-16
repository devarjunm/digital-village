import 'package:flutter/material.dart';
import 'features/splash/splash_screen.dart';

void main() {
  runApp(const DigitalVillageApp());
}

class DigitalVillageApp extends StatelessWidget {
  const DigitalVillageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Digital Village",
      home: const SplashScreen(),
    );
  }
}