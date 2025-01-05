import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Investment Portfolio'),
        backgroundColor: Color(0xFF264653),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Your Investments',
              style: TextStyle(
                color: Color(0xFF264653),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            InvestmentCategory(
              category: 'P2P Lending',
              investments: [
                InvestmentData('Platform A', '₹50,000'),
                InvestmentData('Platform B', '₹30,000'),
              ],
            ),
            InvestmentCategory(
              category: 'NCD',
              investments: [
                InvestmentData('Company X', '₹75,000'),
                InvestmentData('Company Y', '₹60,000'),
              ],
            ),
            InvestmentCategory(
              category: 'Invoice Discounting',
              investments: [
                InvestmentData('Vendor 1', '₹100,000'),
                InvestmentData('Vendor 2', '₹45,000'),
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
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF264653),
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
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    investment.amount,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
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