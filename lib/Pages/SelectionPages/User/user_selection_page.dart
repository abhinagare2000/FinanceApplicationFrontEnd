import 'package:flutter/material.dart';
import '../../SignUpPages/signup_page_user.dart';
import '../../LoginPages/login_page_user.dart';

class UserSelectionPage extends StatefulWidget {
  const UserSelectionPage({super.key});
  @override
  _UserSelectionPageState createState() => _UserSelectionPageState();
}

class _UserSelectionPageState extends State<UserSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Account',
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
              child: LoginPageUser(),
              ),
          ],
        ),
      ),
    );
  }
}
