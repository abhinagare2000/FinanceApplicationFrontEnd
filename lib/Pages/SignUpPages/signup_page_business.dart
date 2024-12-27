import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Utils/loadFIleUtils.dart';

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
  final TextEditingController _bDOIController = TextEditingController();
  final TextEditingController _bCapitalController = TextEditingController();

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
      String bEmail = _bEmailController.text;
      String bPassword = hashPassword(_bPasswordController.text);
      String bName = _bNameController.text;
      String bType = _bTypeController.text;
      String bPhone = _bPhoneController.text;
      DateTime bDateOfIncorporation = DateTime.parse(_bDOIController.text);
      double bCapital = double.parse(_bCapitalController.text);

      var url = Uri.parse('http://localhost:8080/createBusinessAccount');
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'bEmail': bEmail,
          'bPassword': bPassword,
          'bName': bName,
          'bCountry': _selectedCountry,
          'bCurrency': _selectedCurrency,
          'bPhone': bPhone,
          'bType': bType,
          'bDateOfIncorporation': bDateOfIncorporation.toIso8601String(),
          'bCapital': bCapital,
        }),
      );
      if (response.statusCode == 200) {
        // Handle success
        print('Business account created successfully');
      } else {
        // Handle error
        print('Failed to create Business account');
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
              controller: _bEmailController,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: _bEmailController.text.isEmpty ? 'Email is required' : null,
              ),
            ),
            TextField(
              controller: _bPasswordController,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: _bPasswordController.text.isEmpty ? 'Password is required' : null,
              ),
              obscureText: true,
            ),
            TextField(
              controller: _bNameController,
              decoration: InputDecoration(
                labelText: 'Business Name',
                errorText: _bNameController.text.isEmpty ? 'Business Name is required' : null,
              ),
              obscureText: true,
            ),
            TextField(
              controller: _bPhoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
                errorText: _bPhoneController.text.isEmpty ? 'Phone is required' : null,
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _bTypeController,
              decoration: InputDecoration(
                labelText: 'Business Type',
                errorText: _bTypeController.text.isEmpty ? 'Business Type is required' : null,
              ),
              obscureText: true,
            ),
            TextField(
              controller: _bDOIController,
              decoration: const InputDecoration(
                labelText: 'Business Date of Incorporation',
                hintText: 'YYYY-MM-DD',
              ),
              keyboardType: TextInputType.datetime,
            ),
            TextField(
              controller: _bCapitalController,
              decoration: InputDecoration(
                labelText: 'Business Capital',
                prefixText: _selectedCurrency,
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