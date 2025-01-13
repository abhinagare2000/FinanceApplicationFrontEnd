import 'package:flutter/material.dart';
import '../../../Themes/appTheme.dart';
import 'Lending/InvoiceDiscountingOptions.dart';
import 'Lending/NCDOptions.dart';
import 'Lending/P2POptions.dart';

class InvestScreen extends StatelessWidget {
  const InvestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text('Investment Options', style: TextStyle(color: Colors.white70)),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.all(8), // Adjust padding if necessary
          child: Container(
            decoration: AppTheme.iconBackGroundDecoration,
            child: IconButton(
              icon: Icon(Icons.candlestick_chart, color: AppTheme.greenAccentColor), // Back arrow color
              onPressed: () {
                Navigator.pop(context); // Handle back navigation
              },
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFFece6f0),
        child: SingleChildScrollView(
          padding: AppTheme.cardPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryCard(
                context,
                'P2P Lending',
                'Lend to businesses and earn interest',
                Icons.group,
              ),
              _buildCategoryCard(
                context,
                'Invoice Discounting',
                'Discounting of invoices for high returns',
                Icons.description,
              ),
              _buildCategoryCard(
                context,
                'NCDs',
                'Earn higher returns with NCDs',
                Icons.trending_up,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, String title, String subtitle, IconData icon) {
    return Card(
      color: AppTheme.primaryColor,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Container(
          padding: AppTheme.iconBackGroundPadding,
          decoration: AppTheme.iconBackGroundDecoration,
          child: Icon(icon, color: AppTheme.greenAccentColor),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppTheme.accentColor,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Color(0xCCFFFFFF),
            fontSize: 14,
          ),
        ),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                if (title == 'Invoice Discounting') {
                  return InvoiceDiscountingOptionsScreen();
                } else if (title == 'P2P Lending') {
                  return P2POptionsScreen();
                } else if (title == 'NCDs') {
                  return NCDOptionsScreen();
                } else {
                  return Container();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
