import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  Widget languageButton(String text, String emoji) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            "$emoji   $text",
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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

              languageButton("मराठी", "🇮🇳"),
              languageButton("हिन्दी", "🇮🇳"),
              languageButton("English", "🇬🇧"),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 18),
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