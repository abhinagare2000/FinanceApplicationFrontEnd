import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Utils/validationUtils.dart';

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

  Future<void> _signUp() async {
    try {
      String bEmail = _bEmailController.text;
      String bPassword = hashPassword(_bPasswordController.text);
      String bName = _bNameController.text;
      String bType = _bTypeController.text;
      String bPhone = _bPhoneController.text;
      DateTime bDateOfIncorporation = DateTime.parse(_bDOIController.text);
      double bCapital = double.parse(_bCapitalController.text);

      var url = Uri.parse('http://192.168.1.3:8080/createBusinessAccount');
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'bEmail': bEmail,
          'bPassword': bPassword,
          'bName': bName,
          'bCountry': "India",
          'bCurrency': "₹",
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
            color: Colors.black, // Text color
            fontSize: 30, // Optional: Adjust font size
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _bEmailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(Icons.email),
              ),
              validator: validateEmail,
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: _bPasswordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(Icons.key),
              ),
              obscureText: true,
              validator: validatePassword,
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: _bNameController,
              decoration: InputDecoration(
                labelText: 'Business Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(Icons.business),
              ),
              obscureText: true,
              validator: validateBusinessName,
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: _bPhoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.number,
              validator: validatePhone,
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: _bTypeController,
              decoration: InputDecoration(
                labelText: 'Business Type',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(Icons.business_center),
              ),
              obscureText: true,
              validator: validateBusinessType,
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: _bDOIController,
              decoration: const InputDecoration(
                labelText: 'Business Date of Incorporation',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'YYYY-MM-DD',
                prefixIcon: Icon(Icons.date_range),
              ),
              keyboardType: TextInputType.datetime,
              validator: validateDOI,
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: _bCapitalController,
              decoration: InputDecoration(
                labelText: 'Business Capital',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(Icons.currency_rupee),
              ),
              keyboardType: TextInputType.number,
              validator: validateCapital,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 400, // Set the desired width
              child: ElevatedButton(
                onPressed: _signUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Set the background color
                ),
                child: const Text(
                  'Sign Up',
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
      ),
    );
  }
}
