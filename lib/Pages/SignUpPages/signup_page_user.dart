import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

String hashPassword(String password) {
  var bytes = utf8.encode(password);
  var hashedPassword = sha256.convert(bytes).toString();
  return hashedPassword;
}

class SignUpPageUser extends StatefulWidget {
  const SignUpPageUser({super.key});

  @override
  _SignUpPageUserState createState() => _SignUpPageUserState();
}

class _SignUpPageUserState extends State<SignUpPageUser> {
  final TextEditingController _uEmailController = TextEditingController();
  final TextEditingController _uPasswordController = TextEditingController();
  final TextEditingController _uNameController = TextEditingController();
  final TextEditingController _uPhoneController = TextEditingController();
  final TextEditingController _uAgeController = TextEditingController();

  Future<void> _signUp() async {
    try {
      String uEmail = _uEmailController.text;
      String uPassword = hashPassword(_uPasswordController.text);
      String uName = _uNameController.text;
      String uPhone = _uPhoneController.text;
      String uAge = _uAgeController.text;
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
          'Personal Sign Up',
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
              controller: _uEmailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _uPasswordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: _uNameController,
              decoration: const InputDecoration(labelText: 'Name'),
              obscureText: true,
            ),
            TextField(
              controller: _uPhoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _uAgeController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
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
