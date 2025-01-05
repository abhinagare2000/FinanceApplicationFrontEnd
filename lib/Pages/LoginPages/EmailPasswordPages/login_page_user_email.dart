import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../../../Themes/appTheme.dart';
import '../../AccountPages/PersonalAccountPages/ClubPages.dart';
import '../../SignUpPages/signup_page_user.dart';
import '../../../Utils/validationUtils.dart';
import 'package:http/http.dart' as http;

String hashPassword(String password) {
  var bytes = utf8.encode(password);
  var hashedPassword = sha256.convert(bytes).toString();
  return hashedPassword;
}

class LoginPageUserEmail extends StatefulWidget {
  const LoginPageUserEmail({super.key});

  @override
  _LoginPageUserEmailState createState() => _LoginPageUserEmailState();
}

class _LoginPageUserEmailState extends State<LoginPageUserEmail> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  Future<void> _login() async {
    try {
      String email = _emailController.text;
      String password = hashPassword(_passwordController.text);

      if (email.isNotEmpty && password.isNotEmpty) {
        // Add your login logic here
        var url = Uri.parse(
            'http://192.168.8.244:8080/validatePersonalAccountCredentials');
        var response = await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'uEmail': email,
            'uPassword': password,
          }),
        );
        if (response.statusCode == 200) {
          // Handle success
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Email & Password Verified Successfully!')),
          );
          ClubPages();
        } else {
          // Handle error
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Failed to validate email or password!')),
          );
        }
      } else {
        // Show an error message if the input is invalid
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'Please enter email or password')),
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
      appBar: AppBar(
        title: Text(
          'Personal Account',
          style: TextStyle(
            color: AppTheme.primaryColor, // Text color
            fontSize: 30, // Optional: Adjust font size
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Positioned(
          bottom: 40,
          left: 20,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
              shape: WidgetStateProperty.all(const CircleBorder()),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Enter your",
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.normal),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Email & Password",
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.normal),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.primaryColor),
                ),
              ),
              validator: validateEmail,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscureText, // Dynamically toggles visibility
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.key),
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
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.primaryColor),
                ),
              ),
              validator: validatePassword,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 400, // Set the desired width
              child: ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor, // Set the background color
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 16.0, // Optional: Adjust font size
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text("If You Don't have account"),
            SizedBox(
              width: 400, // Set the desired width
              child:
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
                  AppTheme.primaryColor, // Set the background color
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 16.0, // Optional: Adjust font size
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
