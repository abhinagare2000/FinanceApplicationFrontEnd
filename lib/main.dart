import 'package:flutter/material.dart';
import 'Pages/SelectionPages/account_selection_page.dart';
import 'Pages/Component/ScrollablePages/mainScrollableViewPages.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal).copyWith(
          primary: Colors.teal, // A calming teal as the primary color
          secondary: Colors.orangeAccent, // A vibrant orange for highlights
          surface: const Color(
              0xFFece6f0), // Clean and simple for card backgrounds// A subtle off-white for app background
          error: Colors.redAccent, // A bright red for error messages
          onPrimary:
              Colors.white, // Text on primary should be white for contrast
          onSecondary: Colors.black, // Black text on secondary color
          onSurface:
              Colors.black87, // Text on surfaces should be close to black
          onError: Colors.white, // White text on error backgrounds
          brightness: Brightness.light, // A light theme overall
        ),
      ),
      home: Scaffold(
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
      ),
    );
  }
}
