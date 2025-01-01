import 'package:flutter/material.dart';

import '../../../../Themes/appTheme.dart';
class InvoiceDiscountingOptionsScreen extends StatelessWidget {
  const InvoiceDiscountingOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text('Invoice Discounting', style: TextStyle(color: AppTheme.accentColor)),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.all(8), // Adjust padding if necessary
          child: Container(
            decoration: AppTheme.iconBackGroundDecoration,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: AppTheme.greenAccentColor), // Back arrow color
              onPressed: () {
                Navigator.pop(context); // Handle back navigation
              },
            ),
          ),
        ),
      ),
      body: Center(
        child: Text('Invoice Discounting Content'),
      ),
    );
  }
}