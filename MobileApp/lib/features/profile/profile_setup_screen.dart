import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatefulWidget {
  final String language;

  const ProfileSetupScreen({
    super.key,
    required this.language,
  });

  @override
  State<ProfileSetupScreen> createState() =>
      _ProfileSetupScreenState();
}

class _ProfileSetupScreenState
    extends State<ProfileSetupScreen> {

  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final landAreaController = TextEditingController();

  String? gender;
  String? soilType;
  String? waterSource;
  String? cropName;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    landAreaController.dispose();
    super.dispose();
  }

  void saveProfile() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Profile information is valid"),
      ),
    );

    // Backend API connection will be added in the next step.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Farmer Profile"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Complete Your Profile",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Tell us about yourself and your farm.",
              ),

              const SizedBox(height: 25),

              // First name
              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  labelText: "First Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().length < 3) {
                    return "Enter at least 3 characters";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              // Last name
              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  labelText: "Last Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter your last name";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              // Gender
              DropdownButtonFormField<String>(
                value: gender,
                decoration: const InputDecoration(
                  labelText: "Gender",
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "male",
                    child: Text("Male"),
                  ),
                  DropdownMenuItem(
                    value: "female",
                    child: Text("Female"),
                  ),
                  DropdownMenuItem(
                    value: "other",
                    child: Text("Other"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),

              const SizedBox(height: 25),

              const Text(
                "Farm Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // Land
              TextFormField(
                controller: landAreaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Total Land Area (acres)",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final land = double.tryParse(value ?? "");

                  if (land == null || land <= 0) {
                    return "Enter valid land area";
                  }

                  if (land > 10000) {
                    return "Land area cannot exceed 10000 acres";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              // Soil
              DropdownButtonFormField<String>(
                value: soilType,
                decoration: const InputDecoration(
                  labelText: "Soil Type",
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Black Soil",
                    child: Text("Black Soil"),
                  ),
                  DropdownMenuItem(
                    value: "Red Soil",
                    child: Text("Red Soil"),
                  ),
                  DropdownMenuItem(
                    value: "Alluvial Soil",
                    child: Text("Alluvial Soil"),
                  ),
                  DropdownMenuItem(
                    value: "Other",
                    child: Text("Other"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    soilType = value;
                  });
                },
              ),

              const SizedBox(height: 15),

              // Water source
              DropdownButtonFormField<String>(
                value: waterSource,
                decoration: const InputDecoration(
                  labelText: "Water Source",
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Borewell",
                    child: Text("Borewell"),
                  ),
                  DropdownMenuItem(
                    value: "Well",
                    child: Text("Well"),
                  ),
                  DropdownMenuItem(
                    value: "Canal",
                    child: Text("Canal"),
                  ),
                  DropdownMenuItem(
                    value: "Rain",
                    child: Text("Rain"),
                  ),
                  DropdownMenuItem(
                    value: "Other",
                    child: Text("Other"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    waterSource = value;
                  });
                },
              ),

              const SizedBox(height: 15),

              // Crop
              DropdownButtonFormField<String>(
                value: cropName,
                decoration: const InputDecoration(
                  labelText: "Current Crop",
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Maize",
                    child: Text("Maize"),
                  ),
                  DropdownMenuItem(
                    value: "Wheat",
                    child: Text("Wheat"),
                  ),
                  DropdownMenuItem(
                    value: "Cotton",
                    child: Text("Cotton"),
                  ),
                  DropdownMenuItem(
                    value: "Soybean",
                    child: Text("Soybean"),
                  ),
                  DropdownMenuItem(
                    value: "Onion",
                    child: Text("Onion"),
                  ),
                  DropdownMenuItem(
                    value: "Other",
                    child: Text("Other"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    cropName = value;
                  });
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: saveProfile,

                  child: const Padding(
                    padding: EdgeInsets.all(15),

                    child: Text(
                      "Save Profile",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}