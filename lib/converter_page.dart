import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String name = "";
  String? nameError;
  String? emailError;
  String? passError;

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Converter Page")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                errorText: nameError,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                errorText: emailError,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: passController,
              obscureText: !showPassword,
              decoration: InputDecoration(
                labelText: "Password",
                errorText: passError,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nameError = null;
                  emailError = null;
                  passError = null;

                  if (nameController.text.isEmpty) {
                    nameError = "Name required";
                  }
                  if (emailController.text.isEmpty) {
                    emailError = "Email required";
                  }
                  if (passController.text.isEmpty) {
                    passError = "Password required";
                  }

                  if (nameError == null &&
                      emailError == null &&
                      passError == null) {
                    name = nameController.text;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Form submitted successfully!"),
                      ),
                    );
                  }
                });
              },
              child: const Text("Submit"),
            ),
            const SizedBox(height: 25),
            Text("Output: $name"),
          ],
        ),
      ),
    );
  }
}
