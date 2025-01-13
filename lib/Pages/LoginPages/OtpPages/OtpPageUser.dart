import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../Themes/appTheme.dart';
import '../../../Utils/validationUtils.dart';
import '../../../Pages/AccountPages/PersonalAccountPages/ClubPages.dart';

class OtpPageUser extends StatefulWidget {
  const OtpPageUser({super.key, required this.mobileNumber});
  final String mobileNumber;
  @override
  _OtpPageUserState createState() => _OtpPageUserState();
}

class _OtpPageUserState extends State<OtpPageUser> {
  final TextEditingController _otpController = TextEditingController();

  void _verifyOtp() async{
    // Add OTP verification logic here
    String otp = _otpController.text;
    var url = Uri.parse('http://192.168.1.3:8080/validateOTP');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'OTP': otp,
        'phone': widget.mobileNumber,
      }),
    );
    if (response.statusCode == 200) {
      // Handle success
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP verified successfully!')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ClubPages()),
      );
    } else {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to validate OTP!')),
      );
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
            icon: const Icon(Icons.arrow_back, color: AppTheme.primaryColor),
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
                "Enter OTP",
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.normal),
              ),
            ),
            TextFormField(
              controller: _otpController,
              decoration: const InputDecoration(
                labelText: 'OTP',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.primaryColor),
                ),
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.number,
              validator: validateOtp,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 400, // Set the desired width
              child: ElevatedButton(
                onPressed: _verifyOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor, // Set the background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(8.0), // Slightly rounded corners
                  ),
                ),
                child: const Text(
                  'Verify OTP',
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