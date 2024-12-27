import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

String hashPassword(String password) {
  var bytes = utf8.encode(password);
  var hashedPassword = sha256.convert(bytes).toString();
  return hashedPassword;
}

class SignupPageBusiness extends StatefulWidget {
  const SignupPageBusiness({super.key});

  @override
  _SignupPageBusinessState createState() => _SignupPageBusinessState();
}

class _SignupPageBusinessState extends State<SignupPageBusiness> {
  final TextEditingController _bEmailController = TextEditingController();
  final TextEditingController _bPasswordController = TextEditingController();
  final TextEditingController _bNameController = TextEditingController();
  final TextEditingController _bPhoneController = TextEditingController();
  final TextEditingController _bTypeController = TextEditingController();

  Future<void> _signUp() async {
    try {
      String bEmail = _bEmailController.text;
      String bPassword = hashPassword(_bPasswordController.text);
      String bName = _bNameController.text;
      String bPhone = _bPhoneController.text;
      String bType = _bTypeController.text;
    } catch (e) {
      // Handle error
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Business Sign Up',
          style: TextStyle(
            color: Color(0xFF05659C), // Text color
            fontSize: 30, // Optional: Adjust font size
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF05659C)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _bEmailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _bPasswordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: _bNameController,
              decoration: const InputDecoration(labelText: 'Business Name'),
              obscureText: true,
            ),
            TextField(
              controller: _bPhoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _bTypeController,
              decoration: const InputDecoration(labelText: 'Business Type'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signUp,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFFCEE5E4), // Set the background color
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Color(0xFF05659C), // Text color
                  fontSize: 16.0, // Optional: Adjust font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
