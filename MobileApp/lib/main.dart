import 'package:flutter/material.dart';
import 'core/theme/app_themes.dart';
import 'features/language/language_screen.dart';

void main() {
  runApp(const DigitalVillageApp());
}

class DigitalVillageApp extends StatelessWidget {
  const DigitalVillageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Digital Village",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),
      ),
      home: const LanguageScreen(),
    );
  }
}