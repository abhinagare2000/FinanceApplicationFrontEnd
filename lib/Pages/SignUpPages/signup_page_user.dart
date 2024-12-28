import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Utils/validationUtils.dart';

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
      int uAge = int.parse(_uAgeController.text);

      var url = Uri.parse('http://192.168.1.3:8080/createUserAccount');
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'uEmail': uEmail,
          'uPassword': uPassword,
          'uName': uName,
          'uCountry': "India",
          'uCurrency': "₹",
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
                controller: _uEmailController,
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
                controller: _uPasswordController,
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
                controller: _uNameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
                obscureText: true,
                validator: validateName,
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: _uPhoneController,
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
                controller: _uAgeController,
                decoration: InputDecoration(
                  labelText: 'Age in years',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.cake),
                ),
                keyboardType: TextInputType.number,
                validator: validateAge,
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
