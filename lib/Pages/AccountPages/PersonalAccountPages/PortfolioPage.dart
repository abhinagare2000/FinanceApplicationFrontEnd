import 'package:flutter/material.dart';

import '../../../Themes/appTheme.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Investment Portfolio',style: TextStyle(color: Colors.white70)),
        backgroundColor: AppTheme.primaryColor,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            InvestmentCategory(
              category: 'P2P Lending',
              investments: [
                InvestmentData('Borrower Company Name 1', '₹50,000'),
                InvestmentData('Borrower Company Name 2', '₹30,000'),
              ],
            ),
            InvestmentCategory(
              category: 'Invoice Discounting',
              investments: [
                InvestmentData('Vendor 1', '₹100,000'),
                InvestmentData('Vendor 2', '₹45,000'),
              ],
            ),
            InvestmentCategory(
              category: 'NCD',
              investments: [
                InvestmentData('Company X', '₹75,000'),
                InvestmentData('Company Y', '₹60,000'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InvestmentCategory extends StatelessWidget {
  final String category;
  final List<InvestmentData> investments;

  const InvestmentCategory({
    Key? key,
    required this.category,
    required this.investments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ...investments.map((investment) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    investment.name,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    investment.amount,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class InvestmentData {
  final String name;
  final String amount;

  InvestmentData(this.name, this.amount);
}