import 'package:flutter/material.dart';
import 'otp_screen.dart'; // Add this at the top of login_screen.dart

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Digital Village"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),

            const Icon(
              Icons.agriculture,
              size: 80,
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            const Text(
              "Welcome Farmer",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              "Enter Mobile Number",
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            TextField(
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                prefixText: "+91 ",
                border: OutlineInputBorder(),
                hintText: "9876543210",
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  print("Continue button pressed");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OtpScreen(),
                    ),
                  );
               },
               child: const Text("Continue"),
               
              ),
            ),

            const Spacer(),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock, size: 18),
                SizedBox(width: 8),
                Text("Secure Login"),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
