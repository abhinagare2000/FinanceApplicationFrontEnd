import 'package:financeapplication1/Pages/LoginPages/login_page_business.dart';
import 'package:flutter/material.dart';
import '../../SignUpPages/signup_page_business.dart';
import '../../LoginPages/login_page_business.dart';

class BusinessSelectionPage extends StatefulWidget {
  const BusinessSelectionPage({super.key});
  @override
  _BusinessSelectionPageState createState() => _BusinessSelectionPageState();
}

class _BusinessSelectionPageState extends State<BusinessSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Business Account',
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: LoginPageBusiness(),
            ),
          ],
        ),
      ),
    );
  }
}
