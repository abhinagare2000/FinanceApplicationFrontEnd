import 'package:financeapplication1/main.dart';
import 'package:flutter/material.dart';
import '../../../Pages/SelectionPages/account_selection_page.dart';
import '../../../Themes/appTheme.dart';
import '../../Component/ScrollablePages/mainScrollableViewPages.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: AppTheme.primaryColor,
                child: Icon(Icons.person, size: 50, color: AppTheme.textColor),
              ),
            ),
            Text(
              'Abhishek',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Software Engineer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            Text(
              'Maharashtra, India',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.white, // Set the background color
                        side: const BorderSide(
                            color:
                                AppTheme.primaryColor), // Set the border color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Slightly rounded corners
                        ),
                        padding: const EdgeInsets.all(16.0),
                      ),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: AppTheme.primaryColor, // Text color
                          fontSize: 16.0, // Optional: Adjust font size
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppTheme.primaryColor, // Set the background color
                        side: const BorderSide(
                            color:
                                AppTheme.primaryColor), // Set the border color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Slightly rounded corners
                        ),
                        padding: const EdgeInsets.all(16.0),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 16.0, // Optional: Adjust font size
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildSettingItem(
              'Investment Preferences',
              Icons.trending_up,
              'We use your investment preferences to recommend deals. You can change these settings at any time.',
            ),
            _buildSettingItem(
              'Phone number',
              Icons.phone,
              null,
            ),
            _buildSettingItem(
              'Email',
              Icons.email,
              null,
            ),
            _buildSettingItem(
              'Password',
              Icons.key,
              null,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Scaffold(
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: OnboardingScreen(),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 80.0,  // Set the desired height
                              child: const AccountSelectionPage(),
                            ),
                          ],
                        ),
                      ),
                    ),),
                  );},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppTheme.primaryColor, // Set the background color
                    side: const BorderSide(
                        color: AppTheme.primaryColor), // Set the border color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Slightly rounded corners
                    ),
                    padding: const EdgeInsets.all(16.0),
                  ),
                  child: const Text(
                    'Sign out',
                    style: TextStyle(
                      color: AppTheme.textColor, // Text color
                      fontSize: 16.0, // Optional: Adjust font size
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(String title, IconData icon, String? subtitle) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppTheme.primaryColor),
      ),
      title: Text(title),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(color: Colors.black54),
            )
          : null,
      trailing: Icon(Icons.chevron_right),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onTap: () {},
    );
  }
}
