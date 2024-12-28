import 'package:flutter/material.dart';
import '../../LoginPages/MobilePages/login_page_user_mobile.dart';

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
            color: Colors.black, // Text color
            fontSize: 30, // Optional: Adjust font size
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Positioned(
          bottom: 30,
          left: 10,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: LoginPageUserMobile(),
              ),
          ],
        ),
      ),
    );
  }
}
