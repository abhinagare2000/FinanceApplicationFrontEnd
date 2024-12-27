import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Pages/SelectionPages/account_selection_page.dart';
import 'Pages/Component/ScrollablePages/mainScrollableViewPages.dart';

void main() async{
  await dotenv.load(fileName: ".env");
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
              0xFFbcd9db), // Clean and simple for card backgrounds// A subtle off-white for app background
          error: Colors.redAccent, // A bright red for error messages
          onPrimary:
              Colors.white, // Text on primary should be white for contrast
          onSecondary: Colors.black, // Black text on secondary color
          onSurface:
              Colors.black87, // Text on surfaces should be close to black
          onError: Colors.white, // White text on error backgrounds
          brightness: Brightness.light, // A light theme overall
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
          bodyLarge: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/images/financeApp.webp',
                  width: 300.0,
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 160.0,  // Set the desired height
                child: const AccountSelectionPage(),
              ),
              Flexible(
                child: OnboardingScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
