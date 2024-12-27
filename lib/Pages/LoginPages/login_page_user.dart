import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'OtpPages/OtpPage.dart';
import '../SignUpPages/signup_page_user.dart';

String hashPassword(String password) {
  var bytes = utf8.encode(password);
  var hashedPassword = sha256.convert(bytes).toString();
  return hashedPassword;
}

class LoginPageUser extends StatefulWidget {
  const LoginPageUser({super.key});

  @override
  _LoginPageUserState createState() => _LoginPageUserState();
}

class _LoginPageUserState extends State<LoginPageUser> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  bool _obscureText = true;
  Future<void> _login() async {
    try {
      String email = _emailController.text;
      String password = hashPassword(_passwordController.text);
      String mobile = _mobileController.text;

      if (mobile.isNotEmpty) {
        // Navigate to OTP page if only mobile number is entered
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OtpPage()),
        );
      } else if (email.isNotEmpty && password.isNotEmpty) {
        // Handle login with email and password
        String hashedPassword = hashPassword(password);
        // Add your login logic here
        print('Email: $email, Password: $hashedPassword');
      } else {
        // Show an error message if the input is invalid
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'Please enter either mobile number or email and password')),
        );
      }
    } catch (e) {
      // Handle error
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: _obscureText, // Dynamically toggles visibility
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText; // Toggles the state
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'or',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: _mobileController,
              decoration: const InputDecoration(labelText: 'Mobile Number'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFFCEE5E4), // Set the background color
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Color(0xFF05659C), // Text color
                  fontSize: 16.0, // Optional: Adjust font size
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                const Text(
                  "If You Don't have an account",
                  style: TextStyle(fontSize: 12.0), // Smaller font size
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPageUser()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFFCEE5E4), // Set the background color
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Color(0xFF05659C), // Text color
                      fontSize: 16.0, // Optional: Adjust font size
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
