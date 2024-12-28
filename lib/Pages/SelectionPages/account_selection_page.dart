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
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const UserSelectionPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Set the background color
                      side: const BorderSide(color: Colors.black), // Set the border color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Slightly rounded corners
                      ),
                      padding: const EdgeInsets.all(16.0),
                    ),
                    child: const Text(
                      'Personal Account',
                      style: TextStyle(
                        color: Colors.black, // Text color
                        fontSize: 16.0, // Optional: Adjust font size
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BusinessSelectionPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Set the background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Slightly rounded corners
                      ),
                      padding: const EdgeInsets.all(16.0),
                    ),
                    child: const Text(
                      'Business Account',
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 16, // Optional: Adjust font size
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