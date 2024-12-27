import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

  String _selectedCountry = 'India';
  String _selectedCurrency = '₹';

  final Map<String, List<String>> countryCurrencies = {
    'India': ['₹'],
    'USA': ['\$'],
    'Europe': ['€'],
    'UK': ['£'],
    'Japan': ['¥'],
  };

  Future<void> _signUp() async {
    try {
      String uEmail = _uEmailController.text;
      String uPassword = hashPassword(_uPasswordController.text);
      String uName = _uNameController.text;
      String uPhone = _uPhoneController.text;
      int uAge = int.parse(_uAgeController.text);

      var url = Uri.parse('http://localhost:8080/createUserAccount');
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'uEmail': uEmail,
          'uPassword': uPassword,
          'uName': uName,
          'uCountry': _selectedCountry,
          'uCurrency': _selectedCurrency,
          'uPhone': uPhone,
          'uAge': uAge,
        }),
      );
      if (response.statusCode == 200) {
        // Handle success
        print('Personal account created successfully');
      } else {
        // Handle error
        print('Failed to create Personal account');
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
            DropdownButton<String>(
              value: _selectedCountry,
              items: countryCurrencies.keys.map((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCountry = newValue!;
                  _selectedCurrency = countryCurrencies[_selectedCountry]!.first;
                });
              },
            ),
            DropdownButton<String>(
              value: _selectedCurrency,
              items: countryCurrencies[_selectedCountry]!.map((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCurrency = newValue!;
                });
              },
            ),
            TextField(
              controller: _uEmailController,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: _uEmailController.text.isEmpty ? 'Email is required' : null,
              ),
            ),
            TextField(
              controller: _uPasswordController,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: _uPasswordController.text.isEmpty ? 'Password is required' : null,
              ),
              obscureText: true,
            ),
            TextField(
              controller: _uNameController,
              decoration: InputDecoration(
                labelText: 'Name',
                errorText: _uNameController.text.isEmpty ? 'Name is required' : null,
              ),
              obscureText: true,
            ),
            TextField(
              controller: _uPhoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
                errorText: _uPhoneController.text.isEmpty ? 'Phone is required' : null,
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _uAgeController,
              decoration: InputDecoration(
                labelText: 'Age in years',
                errorText: _uAgeController.text.isEmpty ? 'Age is required' : null,
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signUp,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFCEE5E4), // Set the background color
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