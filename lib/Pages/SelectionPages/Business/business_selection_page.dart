import 'package:flutter/material.dart';
import '../../LoginPages/MobilePages/login_page_business_mobile.dart';

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
            color: Colors.black, // Text color
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
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: LoginPageBusinessMobile(),
            ),
          ],
        ),
    );
  }
}
