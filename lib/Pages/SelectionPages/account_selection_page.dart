import 'package:flutter/material.dart';
import 'Business/business_selection_page.dart';
import 'User/user_selection_page.dart';
import '../../../Pages/Component/ScrollablePages/mainScrollableViewPages.dart';

class AccountSelectionPage extends StatefulWidget {
  const AccountSelectionPage({super.key});
  @override
  _AccountSelectionPageState createState() => _AccountSelectionPageState();
}

class _AccountSelectionPageState extends State<AccountSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const UserSelectionPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFCEE5E4), // Set the background color
                    ),
                    child: const Text(
                      'Personal Account',
                      style: TextStyle(
                        color: Color(0xFF05659C), // Text color
                        fontSize: 20.0, // Optional: Adjust font size
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BusinessSelectionPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFCEE5E4), // Set the background color
                    ),
                    child: const Text(
                      'Business Account',
                      style: TextStyle(
                        color: Color(0xFF05659C), // Text color
                        fontSize: 20.0, // Optional: Adjust font size
                      ),
                    ),
                  ),
                ],
              ),
            ), // Flexible ensures that the OnboardingScreen also gets some space
          ],
        ),
      ),
    );
  }
}
