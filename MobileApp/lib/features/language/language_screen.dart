import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/login_screen.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String? selectedLanguage;

  Widget languageButton(String text, String languageCode, String emoji) {
    final bool isSelected = selectedLanguage == languageCode;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              selectedLanguage = languageCode;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected
                ? Colors.green.shade100
                : Colors.white,
            foregroundColor: Colors.green.shade800,
            elevation: isSelected ? 3 : 1,
            side: BorderSide(
              color: isSelected
                  ? Colors.green
                  : Colors.green.shade100,
              width: isSelected ? 2 : 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            "$emoji   $text",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  void continueToLogin() {
    if (selectedLanguage == null) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(
          language: selectedLanguage!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool canContinue = selectedLanguage != null;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const SizedBox(height: 60),

              const Icon(
                Icons.agriculture,
                size: 100,
                color: Colors.green,
              ),

              const SizedBox(height: 20),

              Text(
                "DIGITAL VILLAGE",
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Empowering Every Farmer",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),

              const Spacer(),

              Text(
                "Choose Your Language",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              languageButton(
                "मराठी",
                "mr",
                "🇮🇳",
              ),

              languageButton(
                "हिन्दी",
                "hi",
                "🇮🇳",
              ),

              languageButton(
                "English",
                "en",
                "🇬🇧",
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: canContinue
                      ? continueToLogin
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: canContinue
                        ? Colors.green.shade100
                        : Colors.grey.shade200,
                    foregroundColor: canContinue
                        ? Colors.green.shade800
                        : Colors.grey.shade600,
                    elevation: canContinue ? 2 : 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}