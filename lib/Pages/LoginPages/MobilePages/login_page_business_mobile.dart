import 'package:flutter/material.dart';
import 'dart:convert';
import '../../../Themes/appTheme.dart';
import '../OtpPages/OtpPageBusiness.dart';
import '../../SignUpPages/signup_page_business.dart';
import '../../LoginPages/EmailPasswordPages/login_page_business_email.dart';
import '../../../Utils/validationUtils.dart';
import '../../../Pages/AccountPages/BusinessAccountPages/ClubPages.dart';
import 'package:http/http.dart' as http;

class LoginPageBusinessMobile extends StatefulWidget {
  const LoginPageBusinessMobile({super.key});
  @override
  _LoginPageBusinessMobileState createState() =>
      _LoginPageBusinessMobileState();
}

class _LoginPageBusinessMobileState extends State<LoginPageBusinessMobile> {
  final TextEditingController _mobileController = TextEditingController();
  Future<void> _login() async {
    try {
      String mobile = _mobileController.text;

      if (mobile.isNotEmpty) {
        // Navigate to OTP page if only mobile number is entered
        var url = Uri.parse(
            'http://192.168.1.3:8080/validateBusinessAccountCredentials');
        var response = await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'bPhone': mobile,
          }),
        );
        if (response.statusCode == 200) {
          // Handle success
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('OTP Sent!')),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OtpPage(
                  mobileNumber: mobile,
                  accountStr: 'Business Account',
                )),
          );
        } else {
          // Handle error
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to send OTP!')),
          );
        }
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
    // Controls the visibility of the password
    return Scaffold(
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
                "mobile number",
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.normal),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _mobileController,
              decoration: const InputDecoration(
                labelText: 'Mobile Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.primaryColor),
                ),
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
              validator: validatePhone,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 400, // Set the desired width
              child: ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor, // Set the background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Slightly rounded corners
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 16.0, // Optional: Adjust font size
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginPageBusinessEmail()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor, // Set the background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Slightly rounded corners
                  ),
                ),
                child: const Text(
                  'Continue with Email',
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
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupPageBusiness()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor, // Set the background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Slightly rounded corners
                  ), // Set the background color
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
