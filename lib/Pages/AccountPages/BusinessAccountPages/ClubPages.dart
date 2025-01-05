import 'package:financeapplication1/Themes/appTheme.dart';
import 'package:flutter/material.dart';
import '../../../Themes/appTheme.dart';
import 'HomePage.dart';
import 'InsightPage.dart';
import 'BorrowPage.dart';
import 'PortfolioPage.dart';
import 'ProfilePage.dart';

class ClubPages extends StatefulWidget {
  const ClubPages({super.key});

  @override
  State<ClubPages> createState() => _ClubPagesState();
}

class _ClubPagesState extends State<ClubPages> {
  int _currentIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeScreen(),
      BorrowScreen(),
      PortfolioScreen(),
      InsightsScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.white70,
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppTheme.greenAccentColor,
          unselectedItemColor: AppTheme.greenAccentColor,
          backgroundColor: AppTheme.primaryColor,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: _onNavigationItemTapped,
          // Add elevation for shadow effect
          elevation: 8,
          // Add indicator style
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          items: [
            _buildNavItem(Icons.home, 'Home', 0),
            _buildNavItem(Icons.percent, 'Borrow', 1),
            _buildNavItem(Icons.inventory_sharp, 'Portfolio', 2),
            _buildNavItem(Icons.insights_sharp, 'Insights', 3),
            _buildNavItem(Icons.person_outline, 'Profile', 4),
          ],
        ),
      ),
    );
  }

  /// Helper method to build navigation items with indicator
  BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.topCenter,
        children: [
          Icon(icon),
          // Add a small dot indicator for the selected item
          Container(
            margin: const EdgeInsets.only(top: 24),
            width: 30,
            height: 3,
            decoration: BoxDecoration(
              color: _currentIndex == index ? Colors.white70 : Colors.transparent,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ],
      ),
      label: label,
    );
  }

  void _onNavigationItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}